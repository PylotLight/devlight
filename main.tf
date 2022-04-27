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
    organization = "DevLight"
    workspaces {
      tags = ["Pylot"]
    }
  }
}

