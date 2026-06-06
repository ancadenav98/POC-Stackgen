resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name        = "${var.service_name}-vpc"
    Environment = var.environment
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr
}

resource "aws_security_group" "ecs" {

  name   = "${var.service_name}-ecs-sg"

  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {

    from_port   = 0
    to_port     = 0
    protocol    = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_ecs_cluster" "main" {

  name = "${var.service_name}-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_cloudwatch_log_group" "ecs" {

  name = "/ecs/${var.service_name}"

  retention_in_days = 30
}

resource "aws_secretsmanager_secret" "db_password" {

  name = "${var.service_name}-db-password"
}

resource "aws_db_subnet_group" "postgres" {

  name = "${var.service_name}-db-subnet-group"

  subnet_ids = [
    aws_subnet.private.id
  ]
}

resource "aws_db_instance" "postgres" {

  identifier = "${var.service_name}-postgres"

  engine = "postgres"

  instance_class = "db.t3.micro"

  allocated_storage = 20

  username = "postgres"

  password = "ChangeMe123!"

  publicly_accessible = false

  skip_final_snapshot = true

  db_subnet_group_name = aws_db_subnet_group.postgres.name
}

resource "aws_ecs_task_definition" "app" {

  family = var.service_name

  network_mode = "awsvpc"

  requires_compatibilities = [
    "FARGATE"
  ]

  cpu    = 256
  memory = 512

  container_definitions = jsonencode([
    {
      name  = var.service_name
      image = "nginx:latest"

      essential = true

      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]

      logConfiguration = {

        logDriver = "awslogs"

        options = {
          awslogs-group         = aws_cloudwatch_log_group.ecs.name
          awslogs-region        = "us-east-1"
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])
}


resource "aws_ecs_service" "app" {

  name = var.service_name

  cluster = aws_ecs_cluster.main.id

  task_definition = aws_ecs_task_definition.app.arn

  desired_count = 1

  launch_type = "FARGATE"

  network_configuration {

    subnets = [
      aws_subnet.private.id
    ]

    security_groups = [
      aws_security_group.ecs.id
    ]

    assign_public_ip = false
  }
}