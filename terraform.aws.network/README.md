# README 
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)

AWS Network project.

## Resources
- VPC
- DHCP options
- 06 Subnets (public and private)
- Internet Gateway
- Route Table
- NAT Gateway
- Elastic IP

## Requirements
| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.7.30 |


## Getting Started

A simple and classic network configuration composed with a single VPC, 03 public subnets including an Internet Gateway, and 03 private subnets with a NAT Gateway attached.

## How to Run

01. Update the `variables.tf` file with the necessary authentication values. 

| Name | Description |
|------|---------|
| aws_region | AWS region where the resources will be provided |
| aws_profile | AWS CLI configured profile |
| assume_role | AWS Role for Assume Role |


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
| [aws_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | Elastic IP |
| [aws_internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | VPC Internet Gateway |
| [aws_nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | VPC NAT Gateway |
| [aws_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | VPC routing table |
| [aws_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | VPC routing table |
| [aws_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | Route table association |
| [aws_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | VPC subnet |
| [aws_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | VPC |
| [aws_vpc_dhcp_options](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_dhcp_options) | VPC DHCP Options |
| [aws_vpc_dhcp_options_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_dhcp_options_association) | VPC DHCP Options Association |


## Outputs

| Name | Type |
|------|------|
| vpc_id | VPC ID |
| sn_pub | Subnet ID |
| sn_priv | Subnet ID |


## Contact
Author: [@crispy-tk](https://github.com/crispy-tk)