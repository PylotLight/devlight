terraform {
  required_version = ">= 1.1.1"
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
  cloud {
    organization = "Devlight"
    workspaces {
      tags = ["Pylot"]
    }
  }
}
