terraform {
  required_version = ">= 1.1.1"
  required_providers {
     azurerm = {
      source = "hashicorp/azurerm"
      version = "3.3.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  cloud {
    organization = "Devlight"
    workspaces {
      tags = ["Pylot"]
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}


# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-2"
}
