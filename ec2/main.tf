provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "mayank-tf-web-server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id  # Use the specified subnet for launching the instance
  iam_instance_profile = aws_iam_role.example_role.name

  tags = {
    Name = "Web Server"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y httpd
              sudo service httpd start
              sudo chkconfig httpd on
              EOF
}

resource "aws_security_group" "web_server_sg" {
  name        = "web_server_sg"
  description = var.web_server_sg_description

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_iam_instance_profile" "s3_access_role" {
  name = "s3_access_role"
}

resource "aws_iam_role" "s3_access_role" {
  name = "s3_access_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "s3_access_policy" {
  name        = "s3_access_policy"
  description = "Policy for S3 bucket access"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:ListBucket",
          "s3:GetObject",
        ],
        Effect   = "Allow",
        Resource = [
          "arn:aws:s3:::your-s3-bucket-name",
          "arn:aws:s3:::your-s3-bucket-name/*",
        ],
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "s3_access_policy_attachment" {
  policy_arn = aws_iam_policy.s3_access_policy.arn
  roles      = [aws_iam_role.s3_access_role.name]
}

resource "aws_instance" "web_server" {
  # ... (previous configuration)

  iam_instance_profile = aws_iam_instance_profile.s3_access_role.name
}
