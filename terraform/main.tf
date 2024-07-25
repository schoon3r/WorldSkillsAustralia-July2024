terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.34.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# S3 Bucket for Terraform State
resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = var.s3_bucket_name
}

# DynamoDB Table for Terraform State Locking
resource "aws_dynamodb_table" "tf_locks" {
  name           = var.dynamodb_table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

# Terraform Backend Configuration
terraform {
  backend "s3" {
    bucket         = aws_s3_bucket.tf_state_bucket.id
    key            = "terraform/terraform.tfstate"
    region         = var.aws_region
    encrypt        = true
    dynamodb_table = aws_dynamodb_table.tf_locks.name
  }
}
