provider "aws" {
  region = "us-east-1" # region

  default_tags {
    tags = {
      Project   = var.project_name
      Stage     = var.stage
      ManagedBy = "Terraform"
    }
  }
}

terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.67"
    }
  }
}

# Provider for ACM certificate (must be in us-east-1 for CloudFront)
provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}