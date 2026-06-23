variable "project_name" {
  description = "project name"
  type = string
}

variable "env" {
  description = "environment name"
  type = string
}

variable "cidr_block" {
  type        = string
  description = "cidr_block"
  default     = ""
}

