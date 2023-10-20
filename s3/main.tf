resource "aws_s3_bucket" "mayank-tf-bucket" {
  bucket = var.s3_bucket_name
  acl    = var.s3_bucket_acl

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = var.kms_key_id
      }
    }
  }

  website {
    index_document = var.s3_index_document
    error_document = var.s3_error_document
  }
}
