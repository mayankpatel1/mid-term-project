# 3 Tier Website Hosting 

My purpose was to host a website in a 3 tier web architecture which would log new users who register usin lambda function and API gateway. It uses a Virtual Private Cloud (VPC), EC2 instances and load balancing.

## Table Of Contents

-Prerequisites
-Directory Structure
-Configuration
-Deployment
-Cleanup

## Prerequisites

To get started you will need Terraform installed in your terminal and AWS ClI with credentials. 

### Directory Structure

mayank-project/
│
├── vpc/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│
├── dynamodb/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│
├── ec2/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│
├── lambda/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│
├── s3/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│
├── provider.tf
├── backend.tf
├── main.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf



### Configuration

Firstly I wrote my backend.tf and provider.tf files to intialise setup. Then I wrote my modules with variables to configure my VPC with EC2, Lambda, DynamoDB and S3 Bucket.

## Deployment

* How to run the program

Terraform plan 
Terraform Validate
Terraform Apply


### Clean Up

Terraform destroy command
