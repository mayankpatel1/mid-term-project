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
