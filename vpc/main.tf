provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "mayank-tf-project" {
  cidr_block          = var.vpc_cidr
  enable_dns_support  = true
  enable_dns_hostnames = true

  tags = {
    Name = "mayank-tf-project"
  }
}

resource "aws_subnet" "mayank-tf-public-subnet" {
  count = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.mayank-tf-project.id
  cidr_block        = var.public_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "Payank-tf-public-subnet ${count.index + 1}"
  }
}

resource "aws_subnet" "mayank-tf-private-subnet" {
  count = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.mayank-tf-project.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "mayank-tf-private-subnet ${count.index + 1}"
  }
}

resource "aws_internet_gateway" "mayank-tf-igw" {
  vpc_id = aws_vpc.mayank-tf-project.id

  tags = {
    Name = "mayank-tf-igw"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.mayank-tf-project.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mayank-tf-igw.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.mayank-tf-project.id

  tags = {
    Name = "Private Route Table"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  count = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.mayank-tf-public-subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_subnet_association" {
  count = length(var.private_subnet_cidrs)
  subnet_id      = aws_subnet.mayank-tf-private-subnet[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_network_acl" "mayank-tf-nacl" {
  vpc_id = aws_vpc.mayank-tf-project.id

  tags = {
    Name = var.nacl_name
  }
}

resource "aws_network_acl_rule" "inbound_http" {
  rule_number   = 100
  protocol      = "6"
  rule_action   = "allow"
  egress        = false
  cidr_block    = var.inbound_http_cidr
  from_port     = 80
  to_port       = 80
  network_acl_id = aws_network_acl.mayank-tf-nacl.id
}

resource "aws_network_acl_rule" "inbound_https" {
  rule_number   = 200
  protocol      = "6"
  rule_action   = "allow"
  egress        = false
  cidr_block    = var.inbound_https_cidr
  from_port     = 443
  to_port       = 443
  network_acl_id = aws_network_acl.mayank-tf-nacl.id
}

resource "aws_network_acl_rule" "outbound_all" {
  rule_number   = 100
  protocol      = "-1"
  rule_action   = "allow"
  egress        = true
  cidr_block    = var.outbound_all_cidr
  from_port     = 0
  to_port       = 0
  network_acl_id = aws_network_acl.mayank-tf-nacl.id
}

resource "aws_eip" "mayank-tf-eip" {
  count = length(var.private_subnet_cidrs)
}

resource "aws_nat_gateway" "mayank-tf-nat-gateway" {
  count = length(var.private_subnet_cidrs)
  allocation_id = aws_eip.mayank-tf-eip[count.index].id
  subnet_id     = aws_subnet.mayank-tf-private-subnet[count.index].id

  tags = {
    Name = "NAT Gateway ${count.index + 1}"
  }
}
