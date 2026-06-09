terraform {
  required_version = ">= 1.8.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "payment_service" {
  source = "./modules/payment-service"

  service_name = "payment-service"
  environment  = var.environment
}
