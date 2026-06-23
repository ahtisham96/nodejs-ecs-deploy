data "aws_region" "current" {}

resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
  instance_tenancy = "default"
  
  tags = {
    Name = "${var.project_name}-${var.env}-vpc"
  }
}
