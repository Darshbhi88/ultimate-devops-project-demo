terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }

    random = {
    version = ">=3.0"
    source = "hashicorp/random"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "random_string" "random" {
  length = 6
  special = false
  upper = false
  numeric = true
}


resource "aws_s3_bucket" "s3_bucket" {
  bucket = "darsh${random_string.random.result}"
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "dynamodb_table" {
  name = "darsh${random_string.random.result}"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}