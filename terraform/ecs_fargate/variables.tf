variable "project_name" {
  description = "project name"
  type        = string
}

variable "env" {
  description = "environment name"
  type        = string
}

variable "vpc_id" {
  description = "vpc id"
  type        = string
}

variable "subnet_id" {
  description = "subnet id for ECS tasks"
  type        = string
}

