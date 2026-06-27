# --------------------------------------------------
# Common Variables
# --------------------------------------------------
variable "project_name" {
  description = "project name"
  type        = string
}

variable "stage" {
  description = "environment name"
  type        = string
}

# --------------------------------------------------
# VPC module variables
# --------------------------------------------------
variable "cidr_block" {
  description = "cidr_blcok"
  type        = string
}

variable "public_subnets" {
  description = "public subnets"
  type        = string
}

# --------------------------------------------------
# ECS-Fargate module variables
# --------------------------------------------------


