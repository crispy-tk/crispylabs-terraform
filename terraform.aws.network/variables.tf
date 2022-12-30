########################################
#  PROVIDER
########################################
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}
variable "aws_profile" {
  description = "AWS profile for authentication"
  type        = string
  default     = "my-profile"
}
variable "assume_role" {
  description = "AWS role for Assume Role"
  type        = map(any)
  default = {
    "account"   = "012345678901"
    "role_name" = "my-role"
  }
}

########################################
#  RESOURCES
########################################
variable "vpc_name" {
  description = "VPC name"
  type        = string
  default     = "crispy"
}
variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}
variable "sn_pub" {
  description = "List of public subnets"
  type        = map(any)
  default = {
    pub-1a = {
      cidr_block        = "10.0.10.0/24"
      availability_zone = "us-east-1a"
    }
    pub-1b = {
      cidr_block        = "10.0.11.0/24"
      availability_zone = "us-east-1b"
    }
    pub-1c = {
      cidr_block        = "10.0.12.0/24"
      availability_zone = "us-east-1c"
    }
  }
}
variable "sn_priv" {
  description = "List of private subnets"
  type        = map(any)
  default = {
    priv-1a = {
      cidr_block        = "10.0.7.0/24"
      availability_zone = "us-east-1a"
    }
    priv-1b = {
      cidr_block        = "10.0.8.0/24"
      availability_zone = "us-east-1b"
    }
    priv-1c = {
      cidr_block        = "10.0.9.0/24"
      availability_zone = "us-east-1c"
    }
  }
}
variable "rt_priv" {
  description = "Private route table"
  type        = map(any)
  default = {
    cidr_block = "0.0.0.0/0"
  }
}
variable "tags" {
  description = "Resources tags"
  type        = map(any)
  default = {
    "test" = "network-crispy"
  }
}