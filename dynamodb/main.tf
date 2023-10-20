provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "mayank-tf-dynamodb-sg" {
  name_prefix = "dynamodb"
}

resource "aws_dynamodb_table" "mayank-tf-table" {
  name         = var.dynamodb_table_name
  billing_mode = var.dynamodb_billing_mode

  attribute {
    name = "MyHashKey"
    type = "S"
  }
}

resource "aws_iam_role" "mayank-tf-ec2-role" {
  name = var.iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_policy_attachment" "dynamodb_policy_attachment" {
  name       = "ExampleEC2DynamoDBPolicyAttachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  roles      = [mayank-tf-ec2-role.name]
}

resource "aws_iam_policy_attachment" "s3_policy_attachment" {
  name       = "ExampleEC2S3PolicyAttachment"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  roles      = [mayank-tf-ec2-role.name]
}

resource "aws_instance" "example_ec2" {
  // Configuration for your EC2 instance
  instance_type = var.ec2_instance_type
}

resource "aws_dynamodb_table_policy" "mayank-tf-table-policy" {
  name       = "ExampleTablePolicy"
  table_name = mayank-tf-table.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action   = ["dynamodb:GetItem", "dynamodb:PutItem", "dynamodb:UpdateItem", "dynamodb:DeleteItem"],
      Effect   = "Allow",
      Resource = aws_dynamodb_table.example_table.arn,
    }]
  })
}
