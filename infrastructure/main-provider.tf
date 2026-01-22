
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 6.0"
    }
  }
  backend "s3" {
    bucket       = "the-csoc-tf-state"
    key          = "tf-state"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = var.AWS_Region
  default_tags {
    tags = {
      Environment = terraform.workspace
      Project     = var.Project
      Contact     = var.Contact
      ManageBy    = "Terraform"
    }
  }

}
locals {
  prefix = "${var.prefix}-${terraform.workspace}"
}
data "aws_region" "current" {}