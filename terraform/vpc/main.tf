data "aws_region" "current" {}

# create aws vpc
resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  instance_tenancy = "default"
  
  tags = {
    Name = "${var.project_name}-${var.env}-vpc"
  }
}

# create aws subnets
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "${var.project_name}-${var.env}-public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "${var.project_name}-${var.env}-private-subnet"
  }
}