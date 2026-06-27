module "alb" {
  source         = "./alb"
  project_name   = var.project_name
  env            = var.stage
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnet
}
