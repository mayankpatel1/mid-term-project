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

