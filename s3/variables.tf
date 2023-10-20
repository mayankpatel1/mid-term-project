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

