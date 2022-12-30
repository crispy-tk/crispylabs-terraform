# README
![repo-size](https://img.shields.io/github/repo-size/crispy-tk/terraform.aws.iam)

AWS IAM Assume Role resources.

## Resources
- IAM Role with Assume Role policy
- IAM Policy
- IAM Policy attachment

## Requirements
| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.7.30 |

## Getting Started

A single IAM Role resource with a basic Assume Role policy and an additional AWS Managed Policy attached.

## How to Run

01. Update the `variables.tf` file with the necessary authentication values. 

| Name | Description |
|------|---------|
| assume_role | AWS Role for Assume Role |
| aws_profile | AWS CLI configured profile |
| aws_region | AWS region where the resources will be provided |
| iam_principal | ARN of an IAM User |

02. Inicialize Terraform
```terraform
$ terraform init
```
03. Dry-run in order to check the configuration.
```terraform
$ terraform plan
```
04. Deploy.
```terraform
$ terraform apply
```
05. Enter `yes` to confirm the deploy.

## Providers
| Name | Version |
|------|---------|
| [aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) | >= 4.48.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/aws_iam_role) | IAM role |
| [aws_iam_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | IAM Policy attachment |

## Outputs

| Name | Type |
|------|------|
| assumed_role_arn | Assume Role ARN |
| assumed_role_name | Assume Role Name |


## Contact
Author: [@crispy-tk](https://github.com/crispy-tk)