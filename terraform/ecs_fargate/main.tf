# creating simple ecs cluster
resource "aws_ecs_cluster" "this" {
  name = "${var.project_name}-${var.env}-ecs-fargate"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}


