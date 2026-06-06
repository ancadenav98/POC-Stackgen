moved {
  from = aws_db_instance.postgres
  to   = module.stackgen_b044ac66-3194-5a36-8b9e-6ad6ac7d7eaf.aws_db_instance.this
}

moved {
  from = aws_secretsmanager_secret.db_password
  to   = module.stackgen_00c8fc6c-bdce-552f-89c4-e620e9d5d502.aws_secretsmanager_secret.this
}

moved {
  from = aws_subnet.private
  to   = module.stackgen_0d51730d-c1bb-5446-9ff8-c081a60ab2fd.aws_subnet.this
}

moved {
  from = aws_ecs_cluster.main
  to   = module.stackgen_25da38bc-78ff-5c07-a10d-7c64110eea8d.aws_ecs_cluster.this
}

moved {
  from = aws_db_subnet_group.postgres
  to   = module.stackgen_aca63b5d-2f9f-5fae-999c-29af72136e28.aws_db_subnet_group.this
}

moved {
  from = aws_ecs_service.app
  to   = module.stackgen_d6b44607-a523-5490-85ad-697691a3ad61.aws_ecs_service.this
}

moved {
  from = aws_ecs_task_definition.app
  to   = module.stackgen_de4fd042-aefc-5234-b9e8-cc75606f15eb.aws_ecs_task_definition.this
}

moved {
  from = aws_security_group.ecs
  to   = module.stackgen_f2a50b1d-f90f-5d33-8318-fa6093d053ad.aws_security_group.this
}

moved {
  from = aws_vpc.main
  to   = module.stackgen_fc7a97b6-e7ce-5b41-8e64-e7eeff6c53d6.aws_vpc.this
}

moved {
  from = aws_cloudwatch_log_group.ecs
  to   = module.stackgen_0187b4d1-623c-5f50-a168-3880e2f19f85.aws_cloudwatch_log_group.this
}

moved {
  from = aws_subnet.public
  to   = module.stackgen_7c82f643-a50e-5ead-a4be-e69fdb969256.aws_subnet.this
}


################################################################################

