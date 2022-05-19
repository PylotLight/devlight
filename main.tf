terraform {
  required_version = ">= 1.1.1"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.3.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.21.0"
    }
    # oci = {
    #   source  = "oracle/oci"
    #   version = "> 4.73.0"
    # }
  }
  cloud {
    organization = "DevLight"
    workspaces {
      tags = ["Pylot"]
    }
  }
}

