module "stackgen_00c8fc6c-bdce-552f-89c4-e620e9d5d502" {
  source                  = "./modules/aws_secretsmanager_secret"
  description             = null
  kms_key_id              = module.stackgen_a2d0e2e8-781f-46a3-871f-c6071df447b2.kms_key_id
  name                    = "payment-service-db-password"
  recovery_window_in_days = 30
  tags                    = {}
}

module "stackgen_0187b4d1-623c-5f50-a168-3880e2f19f85" {
  source            = "./modules/aws_cloudwatch_log_group"
  name              = "/ecs/payment-service"
  retention_in_days = 7
  tags              = {}
}

module "stackgen_0d51730d-c1bb-5446-9ff8-c081a60ab2fd" {
  source                  = "./modules/aws_subnet"
  availability_zone       = null
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = false
  tags = {
    Name = "payment-service"
  }
  vpc_id = "vpc-0123456789abcdef0"
}

module "stackgen_25da38bc-78ff-5c07-a10d-7c64110eea8d" {
  source                   = "./modules/aws_ecs_cluster"
  configuration            = []
  name                     = "payment-service-cluster"
  service_connect_defaults = []
  setting                  = []
  tags                     = null
}

module "stackgen_7c82f643-a50e-5ead-a4be-e69fdb969256" {
  source                  = "./modules/aws_subnet"
  availability_zone       = null
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = false
  tags = {
    Name = "payment-service"
  }
  vpc_id = "vpc-0123456789abcdef0"
}

module "stackgen_a2d0e2e8-781f-46a3-871f-c6071df447b2" {
  # Remote source (Git) not detected; resolving from the StackGen Registry. 
  # To enable external ownership, ensure the module is linked to a Git repository.
  source                          = "poc.cloud.stackgen.com/enterprise/aws_kms_key/aws"
  version                         = "1.0.0"
  kms_key_deletion_window_in_days = 30
  kms_key_description             = "KMS key for encryption management"
  kms_key_enable_key_rotation     = true
}

module "stackgen_aca63b5d-2f9f-5fae-999c-29af72136e28" {
  source      = "./modules/aws_db_subnet_group"
  description = "Managed by Terraform"
  name        = "payment-service-db-subnet-group"
  name_prefix = null
  subnet_ids  = null
  tags        = null
}

module "stackgen_b044ac66-3194-5a36-8b9e-6ad6ac7d7eaf" {
  source                                = "./modules/aws_db_instance"
  allocated_storage                     = 20
  allow_major_version_upgrade           = null
  apply_immediately                     = false
  auto_minor_version_upgrade            = true
  availability_zone                     = null
  backup_retention_period               = 0
  backup_target                         = "region"
  backup_window                         = null
  blue_green_update                     = []
  ca_cert_identifier                    = null
  character_set_name                    = null
  copy_tags_to_snapshot                 = false
  custom_iam_instance_profile           = null
  customer_owned_ip_enabled             = null
  db_name                               = null
  db_subnet_group_name                  = null
  dedicated_log_volume                  = null
  delete_automated_backups              = true
  deletion_protection                   = false
  domain                                = null
  domain_auth_secret_arn                = null
  domain_dns_ips                        = null
  domain_fqdn                           = null
  domain_iam_role_name                  = null
  domain_ou                             = null
  enabled_cloudwatch_logs_exports       = null
  engine                                = "postgres"
  engine_lifecycle_support              = "open-source-rds-extended-support"
  engine_version                        = null
  final_snapshot_identifier             = null
  iam_database_authentication_enabled   = null
  identifier                            = null
  identifier_prefix                     = null
  instance_class                        = "db.t3.micro"
  iops                                  = null
  kms_key_id                            = null
  license_model                         = null
  maintenance_window                    = null
  manage_master_user_password           = null
  master_user_secret_kms_key_id         = null
  max_allocated_storage                 = null
  monitoring_interval                   = 0
  monitoring_role_arn                   = null
  multi_az                              = null
  nchar_character_set_name              = null
  network_type                          = null
  option_group_name                     = null
  parameter_group_name                  = null
  password                              = null
  performance_insights_enabled          = false
  performance_insights_kms_key_id       = null
  performance_insights_retention_period = null
  port                                  = null
  publicly_accessible                   = false
  replica_mode                          = null
  replicate_source_db                   = null
  restore_to_point_in_time              = []
  s3_import                             = []
  skip_final_snapshot                   = null
  snapshot_identifier                   = null
  storage_encrypted                     = false
  storage_throughput                    = null
  storage_type                          = null
  tags                                  = null
  timeouts                              = null
  timezone                              = null
  upgrade_storage_config                = null
  username                              = null
  vpc_security_group_ids                = null
}

module "stackgen_d6b44607-a523-5490-85ad-697691a3ad61" {
  source                             = "./modules/aws_ecs_service"
  availability_zone_rebalancing      = "DISABLED"
  capacity_provider_strategy         = []
  cluster                            = module.stackgen_25da38bc-78ff-5c07-a10d-7c64110eea8d.arn
  deployment_circuit_breaker         = []
  deployment_controller              = []
  deployment_maximum_percent         = null
  deployment_minimum_healthy_percent = null
  desired_count                      = 1
  enable_ecs_managed_tags            = null
  enable_execute_command             = null
  force_delete                       = null
  force_new_deployment               = null
  health_check_grace_period_seconds  = null
  iam_role                           = null
  launch_type                        = "EC2"
  load_balancer                      = []
  name                               = "payment-service"
  network_configuration              = []
  ordered_placement_strategy         = []
  placement_constraints              = []
  platform_version                   = "LATEST"
  propagate_tags                     = null
  scheduling_strategy                = "REPLICA"
  service_registries                 = []
  tags                               = null
  task_definition                    = module.stackgen_de4fd042-aefc-5234-b9e8-cc75606f15eb.arn
  timeouts                           = null
  wait_for_steady_state              = null
}

module "stackgen_de4fd042-aefc-5234-b9e8-cc75606f15eb" {
  source                   = "./modules/aws_ecs_task_definition"
  container_definitions    = "var.region"
  cpu                      = "256"
  enable_fault_injection   = false
  ephemeral_storage        = []
  execution_role_arn       = null
  family                   = "payment-service"
  inference_accelerator    = []
  ipc_mode                 = null
  memory                   = "512"
  network_mode             = null
  pid_mode                 = null
  placement_constraints    = []
  proxy_configuration      = []
  requires_compatibilities = []
  runtime_platform         = []
  skip_destroy             = false
  tags                     = {}
  task_role_arn            = null
  track_latest             = false
  volume                   = []
}

module "stackgen_f2a50b1d-f90f-5d33-8318-fa6093d053ad" {
  source                 = "./modules/aws_security_group"
  description            = "Managed by Terraform."
  egress                 = []
  ingress                = []
  name                   = "payment-service-ecs-sg"
  revoke_rules_on_delete = false
  tags = {
    Name = "payment-service"
  }
  timeouts = null
  vpc_id   = "vpc-0123456789abcdef0"
}

module "stackgen_fc7a97b6-e7ce-5b41-8e64-e7eeff6c53d6" {
  source                               = "./modules/aws_vpc"
  cidr_block                           = "10.0.0.0/16"
  enable_dns_hostnames                 = false
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  tags = {
    Environment = "dev"
    Name        = "payment-service-vpc"
  }
}

