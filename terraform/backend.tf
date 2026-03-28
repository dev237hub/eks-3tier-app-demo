terraform {
  backend "s3" {
    bucket         = "backend2023tfbucket"
    key            = "eks/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "eks-terraform-locks"
  }
}
