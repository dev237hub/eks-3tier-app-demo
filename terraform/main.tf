provider "aws" {
  region = "us-east-1"
}

##############################################
# VPC (DIRECT MODULE CALL - CLEAN)
##############################################

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "eks-vpc"
  cidr = "10.0.0.0/16"

  azs = ["us-east-1a", "us-east-1b"]

  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Environment = "dev"
    Project     = "eks-3tier"
  }
}

#############################################
# EKS CLUSTER CREATION
#############################################

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = "three-tier-eks"
  kubernetes_version = "1.29"

  #############################################
  # ACCESS
  #############################################
  endpoint_public_access = true

  enable_cluster_creator_admin_permissions = true

  #############################################
  # NETWORKING (USE YOUR VPC)
  #############################################
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  #############################################
  # NODE GROUP (IMPORTANT FOR PROJECT)
  #############################################
  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }

  #############################################
  # TAGS
  #############################################
  tags = {
    Environment = "dev"
    Terraform   = "true"
    Project     = "eks-3tier"
  }
}