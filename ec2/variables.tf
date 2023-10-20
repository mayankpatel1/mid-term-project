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
