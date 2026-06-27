module "ecs_fargate" {
  source            = "./ecs_fargate"
  project_name      = var.project_name
  env               = var.stage
  vpc_id            = module.vpc.vpc_id
  private_subnet_id = module.vpc.private_subnet
}

