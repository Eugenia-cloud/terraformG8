#main.tf contains the cloud provider info
#AWS Provider Configuration
provider "aws" {
  region = var.region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.26.0"
    }
  }
}
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  required_version = ">= 1.1.0"
  

