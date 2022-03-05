terraform {
  cloud {
    organization = "crispylabs"

    workspaces {
      name = "crispylab-workspace"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "< 4.0.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region                  = "us-east-1"
  shared_credentials_file = "%USERPROFILE%/\\.aws/\\credentials"
  profile                 = "creator"
}
