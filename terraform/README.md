
#  AWS Infrastructure with Terraform (VPC Layer)

<img width="1475" height="664" alt="Screenshot 2026-03-28 094820" src="https://github.com/user-attachments/assets/761d894f-ef1b-41ec-a4a9-b0a1a22d0de4" />

This module provisions a production-style Virtual Private Cloud (VPC) on AWS using Terraform.

---

##  Objective

To design and deploy a highly available and secure network architecture that will host a Kubernetes (EKS) cluster and application workloads.

---

##  Infrastructure Overview

The infrastructure is deployed in **us-east-1** across **2 Availability Zones** for high availability.

### Resources Created --Ref Main.tf

- VPC (CIDR: 10.0.0.0/16)
- 2 Public Subnets
- 2 Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Route Table Associations

---

##  Architecture Design

- **Public Subnets**
  - Used for internet-facing components (e.g., Load Balancer)
  - Connected to Internet Gateway
<img width="1475" height="664" alt="Screenshot 2026-03-28 094820" src="https://github.com/user-attachments/assets/0c458f4b-cc64-4f49-b336-328ea0eb1257" />

- **Private Subnets**
  - Used for internal workloads (e.g., EKS nodes)
  - No direct internet exposure
  - Outbound access via NAT Gateway

---

##  High Availability

- Resources are distributed across **2 Availability Zones**
- Ensures fault tolerance in case of AZ failure

---

## ⚙️ Terraform Implementation

Infrastructure was provisioned using the official Terraform module:

- terraform-aws-modules/vpc/aws

### Key Configuration

```hcl
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
}
