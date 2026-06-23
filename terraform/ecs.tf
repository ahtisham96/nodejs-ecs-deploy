module "ecs_fargate" {
  source = "./ecs_fargate"
  project_name = var.project_name
  env = var.stage
}