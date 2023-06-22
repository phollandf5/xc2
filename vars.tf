locals {
  azs = [
    for each_az in var.azs_short : format("%s%s", var.region, each_az)
  ]
}

variable "region" {
  description = "AWS region name"
  default     = "eu-west-2"
}

variable "azs_short" {
  description = "Assumes three AZs within region.  Locals below will format the full AZ names based on Region"
  default     = ["a", "b", "c"]
}

variable "cidr" {
  description = "cidr used for AWS VPC"
  default     = "10.8.0.0/16"
}

variable "cidrinside" {
  description = "cidr used for AWS VPC"
  default     = "10.8.45.0/24"
}

variable "cidroutside" {
  description = "cidr used for AWS VPC"
  default     = "10.8.55.0/24"
}

variable "cidrworkload" {
  description = "cidr used for AWS VPC"
  default     = "10.8.35.0/24"
}


variable "prefix" {
  description = "prefix used for naming objects created in AWS"
  default     = "pholland"
}

variable "uk_se_name" {
  description = "UK SE name tag"
  default     = "pholland"
}

variable "volterra_namespace_exists" {
  type        = string
  description = "Flag to create or use existing volterra namespace"
  default     = true
}

variable "volterra_namespace" {
  type        = string
  description = "Volterra app namespace where the object will be created. This cannot be system or shared ns."
  default     = "p-holland"
}

variable "site_name" {
  type        = string
  description = "Name of site to be created in Volterra and AWS"
  default     = "dutch"
}

variable "base" {
  default = "my-site"
}

variable "app_domain" {
  type        = string
  description = "FQDN for the app. If you have delegated domain `prod.example.com`, then your app_domain can be `<app_name>.prod.example.com`"
  default     = "prod.volterra.dutchdemo.com"
}

variable "consul_domain" {
  type        = string
  description = "FQDN for the app. If you have delegated domain `prod.example.com`, then your app_domain can be `<app_name>.prod.example.com`"
  default     = "consul.volterra.dutchdemo.com"
}

variable "cloud_cred_name" {
  type        = string
  description = "The object name for your cloud credentials witin Volterra"
  default     = "pholland-dutch-aws"
}

variable "volt_tenant" {
  type        = string
  description = "Volterra tenant name"
  default     = "f5-emea-ent-bceuutam"
}

variable "volt_api_url" {
  type        = string
  description = "Volterra tenant api url"
  default = "https://f5-emea-ent.console.ves.volterra.io/api"
}

variable "volt_api_p12_file" {
  type        = string
  description = "Volterra tenant api key"
  default     = "/Users/pholland/.ssh/f5-emea-ent.console.ves.volterra.io.api-creds.p12"
}

variable "key_pair_name" {
  description = "key_pair name AWS and local"
  default     = "pholland-terraform-created-key-pair"
}