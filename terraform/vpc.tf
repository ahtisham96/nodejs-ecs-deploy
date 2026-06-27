module "vpc" {
  source       = "./vpc"
  cidr_block   = var.cidr_block
  project_name = var.project_name
  env          = var.stage
}
