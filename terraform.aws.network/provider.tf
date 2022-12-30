terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.48.0"
    }
  }
}

provider "aws" {
  region                   = var.aws_region
  shared_config_files      = ["$HOME/.aws/config"]
  shared_credentials_files = ["$HOME/.aws/credentials"]
  profile                  = var.aws_profile

  assume_role {
    role_arn = "arn:aws:iam::${var.assume_role.account}:role/${var.assume_role.role_name}"
  }

  default_tags {
    tags = {
      origin  = "aws.crispylabs"
      project = "aws.network"
    }
  }
}