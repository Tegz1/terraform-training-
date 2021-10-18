terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

   backend "s3" {
    bucket = "precious-terraform-training-s3"
    key    = "precious-terraform-training-s3/terraform.tfstate"
    region = "eu-west-1"
    profile = "default"
    dynamodb_table = "precious_terraform"
  }
}

# Configure the AWS Provider
provider "aws" {
  region              = "eu-west-1"
  profile             = "default"
  allowed_account_ids = ["074656803336"]
}