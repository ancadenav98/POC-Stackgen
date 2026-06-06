# StackGen FinTech PoC

## Overview

This repository contains a simple Terraform implementation used for a StackGen proof of concept.

The goal is to demonstrate how a Platform Engineering team can reuse Terraform modules, apply governance controls, and enable developer self-service through StackGen.

---

## Scenario

The customer is a FinTech company currently deploying infrastructure using a combination of:

- AWS Console
- Manual scripts
- Terraform

They are looking for a way to:

- Standardize infrastructure provisioning
- Enforce governance policies
- Accelerate Terraform adoption
- Enable developer self-service
- Support ongoing migration to AWS

---

## Solution

The proposed approach uses StackGen as a platform layer between developers and AWS.

Platform Engineers are responsible for:

- Maintaining Terraform modules
- Defining governance policies
- Publishing approved templates

Developers can then request infrastructure through StackGen without directly managing Terraform.

---

## Example Service

This repository includes a sample **Payment Service** deployment.

Resources included:

- VPC
- ECS Cluster
- ECS Fargate Service
- PostgreSQL Database
- CloudWatch Logs
- Secrets Manager

---

## Repository Structure

```text
.
├── main.tf
├── variables.tf
├── outputs.tf
└── modules
    └── payment-service
```

---

## Example Workflow

### Platform Engineer

1. Registers Terraform modules in StackGen
2. Creates governance policies
3. Publishes approved templates

### Developer

Requests a new service through StackGen:

```text
Create a payment service in the dev environment
```

StackGen applies the required policies and provisions the infrastructure using approved Terraform modules.

---

## Governance Examples

- Approved AWS regions only
- Mandatory resource tags
- Private databases
- Standard naming conventions

---

## Notes

This project is intentionally simplified for demonstration purposes and focuses on Terraform reuse, governance, and self-service infrastructure workflows.