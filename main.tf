terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    volterra = {
      source  = "volterraedge/volterra"
      version = "0.11.8"
    }
  }
}

provider "volterra" {
  api_p12_file = var.volt_api_p12_file
  url          = var.volt_api_url
}

provider "aws" {
  shared_credentials_files = ["/Users/pholland/.aws/credentials"]
  profile                 = "default"
}

data "http" "myip" {
  url = "https://ifconfig.me"
}
