resource "aws_security_group" "service" {
  name = "${var.service_name}-sg"
}

resource "aws_cloudwatch_log_group" "service" {
  name = "/ecs/${var.service_name}"
}

resource "aws_db_instance" "postgres" {
  identifier          = "${var.service_name}-db"
  engine              = "postgres"
  instance_class      = "db.t3.micro"
  allocated_storage   = 20
  username            = "postgres"
  password            = "ChangeMe123!"
  skip_final_snapshot = true
}
