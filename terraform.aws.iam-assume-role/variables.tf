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
variable "role_name" {
  description = "Name of the role"
  type        = string
  default     = "crispy-role"
}
variable "iam_principal" {
  description = "The ARN IAM User or a service that will assume the role's permissions"
  type        = string
  default     = "value"
}
variable "tags" {
  description = "Resources tags"
  type        = map(any)
  default = {
    "test" = "iam-crispy"
  }
}