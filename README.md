# Serverless HA Wordpress on AWS deployed using Terraform <!-- omit in toc --> 
- [1. Overview](#1-overview)
  - [1.1. Architecture overview](#11-architecture-overview)
- [2. Terraform IaC details](#2-terraform-iac-details)
  - [2.1. Requirements](#21-requirements)
  - [2.2. Providers](#22-providers)
  - [2.3. Modules](#23-modules)
  - [2.4. Resources](#24-resources)
  - [2.5. Inputs](#25-inputs)
  - [2.6. Outputs](#26-outputs)

# 1. Overview
## 1.1. Architecture overview
Here is an overview of the phases and the resources deployed during installation
![Architecture and phases](img/architecture.png)

# 2. Terraform IaC details

<!-- BEGIN_TF_DOCS -->
## 2.1. Requirements

| Name                                                                      | Version  |
| ------------------------------------------------------------------------- | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.0.10 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws)                   | ~> 3.0   |

## 2.2. Providers

| Name                                              | Version |
| ------------------------------------------------- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.0  |

## 2.3. Modules

No modules.

## 2.4. Resources

| Name                                                                                                                                                            | Type        |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_internet_gateway.app_vpc_igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway)                                | resource    |
| [aws_route.app_vpc_rt_pub_route01](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route)                                           | resource    |
| [aws_route_table.app_vpc_rt_pub](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                                       | resource    |
| [aws_route_table.app_vpc_rt_pvt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                                       | resource    |
| [aws_route_table_association.app_vpc_rt_pub_association_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource    |
| [aws_route_table_association.app_vpc_rt_pub_association_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource    |
| [aws_route_table_association.app_vpc_rt_pub_association_3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource    |
| [aws_route_table_association.app_vpc_rt_pvt_association_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource    |
| [aws_route_table_association.app_vpc_rt_pvt_association_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource    |
| [aws_route_table_association.app_vpc_rt_pvt_association_3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource    |
| [aws_subnet.private_subnet_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                               | resource    |
| [aws_subnet.private_subnet_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                               | resource    |
| [aws_subnet.private_subnet_3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                               | resource    |
| [aws_subnet.public_subnet_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                                | resource    |
| [aws_subnet.public_subnet_2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                                | resource    |
| [aws_subnet.public_subnet_3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                                | resource    |
| [aws_vpc.app_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)                                                              | resource    |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity)                                   | data source |

## 2.5. Inputs

| Name                                                                                            | Description                                                                                               | Type     | Default                  | Required |
| ----------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | -------- | ------------------------ | :------: |
| <a name="input_app_name_prefix"></a> [app\_name\_prefix](#input\_app\_name\_prefix)             | Name of the app/service which will use the CI/CD. Prefix (short) version                                  | `string` | `"hawp"`                 |    no    |
| <a name="input_app_name_verbose"></a> [app\_name\_verbose](#input\_app\_name\_verbose)          | Name of the app/service which will use the CI/CD. Verbose version                                         | `string` | `"ha-wordpress"`         |    no    |
| <a name="input_app_repository_name"></a> [app\_repository\_name](#input\_app\_repository\_name) | Name of the repositoy where the IaC and/or app code is stored                                             | `string` | n/a                      |   yes    |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region)                              | Name of the region where resources will be deployed                                                       | `string` | `"eu-west-1"`            |    no    |
| <a name="input_az1"></a> [az1](#input\_az1)                                                     | Availability Zone 1                                                                                       | `string` | `"eu-west-1a"`           |    no    |
| <a name="input_az2"></a> [az2](#input\_az2)                                                     | Availability Zone 2                                                                                       | `string` | `"eu-west-1b"`           |    no    |
| <a name="input_az3"></a> [az3](#input\_az3)                                                     | Availability Zone 3                                                                                       | `string` | `"eu-west-1c"`           |    no    |
| <a name="input_environment"></a> [environment](#input\_environment)                             | Name of the environment in which the CI/CD will deploy (e.g. network, lab, application, DMZ)              | `string` | `"application/websites"` |    no    |
| <a name="input_private_subnet_1"></a> [private\_subnet\_1](#input\_private\_subnet\_1)          | Private subnet AZ1                                                                                        | `string` | `"10.0.7.0/24"`          |    no    |
| <a name="input_private_subnet_2"></a> [private\_subnet\_2](#input\_private\_subnet\_2)          | Private subnet AZ2                                                                                        | `string` | `"10.0.8.0/24"`          |    no    |
| <a name="input_private_subnet_3"></a> [private\_subnet\_3](#input\_private\_subnet\_3)          | Private subnet AZ3                                                                                        | `string` | `"10.0.9.0/24"`          |    no    |
| <a name="input_public_subnet_1"></a> [public\_subnet\_1](#input\_public\_subnet\_1)             | Public subnet AZ1                                                                                         | `string` | `"10.0.107.0/24"`        |    no    |
| <a name="input_public_subnet_2"></a> [public\_subnet\_2](#input\_public\_subnet\_2)             | Public subnet AZ2                                                                                         | `string` | `"10.0.108.0/24"`        |    no    |
| <a name="input_public_subnet_3"></a> [public\_subnet\_3](#input\_public\_subnet\_3)             | Public subnet AZ3                                                                                         | `string` | `"10.0.109.0/24"`        |    no    |
| <a name="input_stage"></a> [stage](#input\_stage)                                               | Name of the stage in which the CI/CD will deploy (e.g. dev, int, prod, test, ephemeral, canary, RC, seed) | `string` | `"dev"`                  |    no    |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr)                                    | CIDR for the VPC                                                                                          | `string` | `"10.0.0.0/16"`          |    no    |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name)                                    | Common name for the VPC                                                                                   | `string` | `"hawp-vpc"`             |    no    |

## 2.6. Outputs

| Name                                                                                                      | Description            |
| --------------------------------------------------------------------------------------------------------- | ---------------------- |
| <a name="output_vpc"></a> [vpc](#output\_vpc)                                                             | VPC for app networking |
| <a name="output_vpc_private_subnet_01"></a> [vpc\_private\_subnet\_01](#output\_vpc\_private\_subnet\_01) | Private subnet 1       |
| <a name="output_vpc_private_subnet_02"></a> [vpc\_private\_subnet\_02](#output\_vpc\_private\_subnet\_02) | Private subnet 2       |
| <a name="output_vpc_private_subnet_03"></a> [vpc\_private\_subnet\_03](#output\_vpc\_private\_subnet\_03) | Private subnet 3       |
| <a name="output_vpc_public_subnet_01"></a> [vpc\_public\_subnet\_01](#output\_vpc\_public\_subnet\_01)    | Public subnet 1        |
| <a name="output_vpc_public_subnet_02"></a> [vpc\_public\_subnet\_02](#output\_vpc\_public\_subnet\_02)    | Public subnet 2        |
| <a name="output_vpc_public_subnet_03"></a> [vpc\_public\_subnet\_03](#output\_vpc\_public\_subnet\_03)    | Public subnet 3        |
<!-- END_TF_DOCS -->