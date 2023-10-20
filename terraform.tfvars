aws_region = "us-east-2"  
vpc_cidr = "10.0.0.0/16"  
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]  
private_subnet_cidrs = ["10.0.4.0/24", "10.0.5.0/24"]  
availability_zones = ["us-east-1a", "us-east-1b"]  
nacl_name = "mayank-tf-nacl"  
inbound_http_cidr = "0.0.0.0/0"  
inbound_https_cidr = "0.0.0.0/0"  
outbound_all_cidr = "0.0.0.0/0"  
s3_bucket_name      = "mayank-s3-bucket"
s3_bucket_acl       = "public-read"
s3_index_document   = "index.html"
s3_error_document   = "error.html"
kms_key_id          = "mayank-tf-kms"  
s3_bucket_name = "mayank-tf-s3-bucket"
sns_topic_name = "mayank-tf-sns"
ami_id = "ami-0c55b159cbfafe1f0"  
instance_type = "t2.micro"
subnet_id = "mayank-tf-private-subnet 
web_server_sg_description = "Security group for the web server EC2 instance"
aws_region = "us-east-2"
dynamodb_table_name = "mayank-tf-table"
dynamodb_billing_mode = "PAY_PER_REQUEST"
iam_role_name = "mayank-tf-ec2-role"
ec2_instance_type = "t2.micro"

