variable "region" {
  default = "us-east-1"
}

variable "bucket_name" {
  description = "S3 bucket name (must be globally unique)"
}

variable "dynamodb_table_name" {
  default = "eks-terraform-locks"
}
