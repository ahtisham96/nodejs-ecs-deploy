module "ecr_repo" {
  source       = "./ecr"
  project_name = var.project_name
  stage        = var.stage
}