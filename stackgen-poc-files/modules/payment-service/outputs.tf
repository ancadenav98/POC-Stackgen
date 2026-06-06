output "service_name" {
  value = var.service_name
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "database_endpoint" {
  value = aws_db_instance.postgres.endpoint
}