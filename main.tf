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
