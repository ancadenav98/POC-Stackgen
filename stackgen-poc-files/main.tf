terraform {
  required_version = ">= 1.8.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "payment_service" {
  source = "./modules/payment-service"

  service_name = "payment-service"

  environment = var.environment

  vpc_cidr = "10.0.0.0/16"

  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
}