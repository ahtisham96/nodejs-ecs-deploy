# creating simple ecs cluster with default settings
resource "aws_ecs_cluster" "this" {
  name = "${var.project_name}-${var.env}-ecs-fargate"
}

#creating ecs task definition
# resource "aws_ecs_task_definition" "this" {
#   family = "${var.project_name}-${var.env}-frontend-task-definition"
#   requires_compatibilities = ["FARGATE"]
#   network_mode = "awsvpc"
#   container_definitions = jsonencode([
#     {
#       name      = "${var.project_name}-${var.env}-frontend-container"
#       image     = "${var.project_name}-${var.env}-frontend-image"
#       cpu       = 1
#       memory    = 256
#       essential = true
#       portMappings = [
#         {
#           containerPort = 8080
#           hostPort      = 8080
#         }
#       ]
#     }
#   ])
# }

resource "aws_ecs_task_definition" "this" {
  family                   = "${var.project_name}-${var.env}-frontend-task-definition"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"

  cpu    = "256"
  memory = "512"

  container_definitions = <<TASK_DEFINITION
[
  {
    "name": "${var.project_name}-${var.env}-frontend-container",
    "image": "${var.project_name}-${var.env}-frontend-image",
    "cpu": 256,
    "memory": 512,
    "essential": true
  }
]
TASK_DEFINITION
}

# creating lb sg group
resource "aws_security_group" "lb" {
    name        = "${var.project_name}-${var.env}-frontend-alb-sg"
    description = "controls access to the ALB"
    vpc_id      = var.vpc_id

    ingress {
        protocol    = "tcp"
        from_port   = 8080
        to_port     = 8080
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        protocol    = "-1"
        from_port   = 0
        to_port     = 0
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "${var.project_name}-${var.env}-frontend-alb-sg"
  }
}

# creating ecs service sg group
resource "aws_security_group" "ecs_tasks" {
    name        = "${var.project_name}-${var.env}-frontend-ecs-sg"
    description = "allow inbound access from the ALB only"
    vpc_id      = var.vpc_id

    ingress {
        protocol        = "tcp"
        from_port       = 8080
        to_port         = 8080
        security_groups = [aws_security_group.lb.id]
    }

    egress {
        protocol    = "-1"
        from_port   = 0
        to_port     = 0
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "${var.project_name}-${var.env}-frontend-ecs-sg"
  }
}

# creating ecs service 
resource "aws_ecs_service" "this" {
  name            = "${var.project_name}-${var.env}-frontend-ecs-service"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.this.arn
  desired_count   = 1
  launch_type = "FARGATE"

  # load_balancer {
  #   target_group_arn = aws_lb_target_group.this.arn
  #   container_name   = "mongo"
  #   container_port   = 8080
  # }
   network_configuration {
    subnets          = [var.private_subnet_id]
    security_groups  = [aws_security_group.ecs_tasks.id]
    assign_public_ip = false
  }

}
