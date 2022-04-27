terraform {
  cloud {
    organization = "Devlight"

    workspaces {
      tags = ["Pylot"]
    }
  }
}

resource "null_resource" "example" {
       triggers = {
         value = "A example resource that does nothing!"
       }
     }
