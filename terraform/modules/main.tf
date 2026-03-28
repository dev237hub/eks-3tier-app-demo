module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = "eks-vpc"
  cidr = "10.0.0.0/16"

  # Multi-AZ (HIGH AVAILABILITY)
  azs = ["us-east-1a", "us-east-1b"]

  # Subnets
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

  # NAT Gateway (private subnet internet access)
  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Environment = "dev"
    Project     = "eks-3tier"
  }
}
