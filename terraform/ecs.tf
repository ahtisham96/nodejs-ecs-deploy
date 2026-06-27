module "ecs_fargate" {
  source       = "./ecs_fargate"
  project_name = var.project_name
  env          = var.stage
  vpc_id       = module.vpc.vpc_id
  subnet_id    = module.vpc.public_subnet
  alb_sg_id    = module.alb.alb_sg_id
}

