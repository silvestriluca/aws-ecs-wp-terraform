####### VARIABLES #######
variable "app_name_verbose" {
  type        = string
  description = "Name of the app/service which will use the CI/CD. Verbose version"
}

variable "app_name_prefix" {
  type        = string
  description = "Name of the app/service which will use the CI/CD. Prefix (short) version"
}

variable "app_repository_name" {
  type        = string
  description = "Name of the repositoy where the IaC and/or app code is stored"
}

variable "aws_region" {
  type        = string
  description = "Name of the region where resources will be deployed"
}

variable "environment" {
  type        = string
  description = "Name of the environment in which the CI/CD will deploy (e.g. network, lab, application, DMZ)"
}

variable "stage" {
  type        = string
  description = "Name of the stage in which the CI/CD will deploy (e.g. dev, int, prod, test, ephemeral, canary, RC, seed)"
}
