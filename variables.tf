variable "aws_region" {
  description = "The AWS region where resources will be created."
  default     = "us-east-2"  
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"  
}

variable "public_subnet_cidrs" {
  description = "A list of CIDR blocks for public subnets."
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"] 
} 

variable "private_subnet_cidrs" {
  description = "A list of CIDR blocks for private subnets."
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]  
}

variable "availability_zones" {
  description = "A list of availability zones for subnets."
  type        = list(string)
  default     = ["us-east-2a", "us-east-2b"]  
}

variable "nacl_name" {
  description = "The name for the Network ACL."
  default     = "mayank-tf-nacl"  
}

variable "inbound_http_cidr" {
  description = "CIDR block for inbound HTTP traffic."
  default     = "0.0.0.0/0"  
}

variable "inbound_https_cidr" {
  description = "CIDR block for inbound HTTPS traffic."
  default     = "0.0.0.0/0"  
}

variable "outbound_all_cidr" {
  description = "CIDR block for outbound traffic."
  default     = "0.0.0.0/0"  
}
variable "s3_bucket_name" {
  description = "The name of the S3 bucket for hosting the static website"
  type        = string
}

variable "s3_bucket_acl" {
  description = "The access control list (ACL) for the S3 bucket"
  type        = string
  default     = "public-read"  #
}

variable "s3_index_document" {
  description = "The index document for the static website"
  type        = string
  default     = "index.html"  #
}

variable "s3_error_document" {
  description = "The error document for the static website"
  type        = string
  default     = "error.html"  
}

variable "kms_key_id" {
  description = "The ID of the KMS key for server-side encryption"
  type        = string
  
}
variable "sns_topic_name" {
  description = "Name for the SNS topic for registration notifications"
  type        = string
}

variable "lambda_execution_role_arn" {
  description = "ARN of the IAM role for the Lambda function"
  type        = string
}

variable "lambda_deployment_package_path" {
  description = "Local path to the Lambda deployment package (ZIP file)"
  type        = string
}
variable "aws_region" {
  description = "The AWS region where resources will be created."
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "The ID of the Amazon Machine Image (AMI) for the EC2 instance."
  type        = string
  default     = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI (adjust for your region)
}

variable "instance_type" {
  description = "The instance type for the EC2 instance."
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the SSH key pair for the EC2 instance."
  type        = string
  default     = "your-key-pair"  # Replace with your key pair name
}

variable "subnet_id" {
  description = "The ID of the subnet in which the EC2 instance will be launched."
  type        = string
  default     = null
}

variable "web_server_sg_description" {
  description = "Description for the security group of the web server."
  type        = string
  default     = "Security group for the web server EC2 instance"
}
variable "aws_region" {
  description = "AWS region where resources will be created."
  default     = "us-east-2"
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table."
  default     = "mayank-tf-table"
}

variable "dynamodb_billing_mode" {
  description = "DynamoDB billing mode."
  default     = "PAY_PER_REQUEST"
}

variable "iam_role_name" {
  description = "Name of the IAM role for EC2 instances."
  default     = "mayank-tf-ec2-role"
}

variable "ec2_instance_type" {
  description = "Type of EC2 instance to launch."
  default     = "t2.micro"
}

