
# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = var.ARM_SUBSCRIPTION_ID
  client_id       = var.ARM_CLIENT_ID
  client_secret   = var.ARM_CLIENT_SECRET
  tenant_id       = var.ARM_TENANT_ID
}

data "azurerm_subscription" "current" {}

resource "azurerm_resource_group" "azure_rg" {
  name     = "DevLight-Resource-Group"
  location = var.azure_region
}

resource "azurerm_monitor_action_group" "azure_mag" {
  name                = "Monitor-Action-Group"
  resource_group_name = azurerm_resource_group.azure_rg.name
  short_name          = "MAG"
}

# resource "azurerm_consumption_budget_subscription" "azure_bs" {
#   name            = "Budget-Subscription"
#   subscription_id = data.azurerm_subscription.current.id

#   amount     = 1
#   time_grain = "Monthly"

#   time_period {
#     start_date = "2022-04-01T00:00:00Z"
#   }

#   filter {
#     dimension {
#       name = "ResourceGroupName"
#       values = [
#         azurerm_resource_group.azure_rg.name,
#       ]
#     }

#     tag {
#       name = "foo"
#       values = [
#         "bar",
#         "baz",
#       ]
#     }
#   }

#   notification {
#     enabled   = true
#     threshold = 0
#     operator  = "GreaterThan"

#     contact_emails = [
#       "foo@example.com",
#       "bar@example.com",
#     ]

#     contact_groups = [
#       azurerm_monitor_action_group.azure_mag.id,
#     ]

#     contact_roles = [
#       "Owner",
#     ]
#   }

#   notification {
#     enabled        = true
#     threshold      = 1.0
#     operator       = "GreaterThan"
#     threshold_type = "Actual"

#     contact_emails = [
#       ""
#     ]
#   }
# }