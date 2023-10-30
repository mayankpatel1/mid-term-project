# 3 Tier Website Hosting

This project aims to host a website using a 3-tier web architecture, which logs new users when they register using a Lambda function and API Gateway. The architecture includes a Virtual Private Cloud (VPC), EC2 instances, and load balancing.

## Table Of Contents

- [Prerequisites](#prerequisites)
- [Directory Structure](#directory-structure)
- [Configuration](#configuration)
- [Deployment](#deployment)
- [Cleanup](#cleanup)

## Prerequisites

Before you begin, make sure you have the following tools and resources:

- [Terraform](https://www.terraform.io/) installed on your local machine.
- AWS CLI configured with your credentials.

### Directory Structure

The project's directory structure is organized as follows:

```plaintext
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
