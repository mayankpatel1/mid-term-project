module "lambda_function" {
  source              = "./lambda/"  
  lambda_function_name = var.lambda_function_name  
  dynamodb_table_name  = var.dynamodb_table_name 
}

module "dynamodb" {
  source = "./dynamodb/"
  table_name = var.table_name
  attribute_name = var.attribute_name
}
module "s3bucket" {
  source = "./s3bucket"
  bucket_name = var.bucket_name
  script_path = var.script_path
  path = var.path
  style_path = var.style_path
}
module "aws_instance" "ec2_instance" {
  source = "./ec2"
  aws_instance_name = var.instance.name
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  security_groups = [var.security_group]

  tags = {
    Name = var.instance_name
  }
}    Terraform   = "true"
    Environment = "dev"
  }
}

module "vpc" {
    source = "./vpc"
    tags = var.tags
    igw_tags = var.igw_tags
    public_subnet_tags = var.public_subnet_tags
    private_subnet_tags = var.private_subnet_tags
    public_route_table_tags = var.public_route_table_tags
    nat_tags = var.nat_tags
    private_route_table_tags = var.private_route_table_tags
    
  }
  
