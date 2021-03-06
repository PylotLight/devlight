
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
  tags     = {}
}

resource "azurerm_monitor_action_group" "azure_mag" {
  name                = "Monitor_Action_Group"
  resource_group_name = azurerm_resource_group.azure_rg.name
  short_name          = "MAG"
  tags                = {}
}

# Create virtual network
resource "azurerm_virtual_network" "az_vnet" {
  name                = "azvnet"
  address_space       = ["172.16.0.0/16"]
  location            = var.azure_region
  resource_group_name = azurerm_resource_group.azure_rg.name
}

# Create subnet
resource "azurerm_subnet" "az_subnet" {
  name                 = "azsubnet"
  resource_group_name  = azurerm_resource_group.azure_rg.name
  virtual_network_name = azurerm_virtual_network.az_vnet.name
  address_prefixes     = ["172.16.1.0/24"]
}

# Create public IPs
resource "azurerm_public_ip" "az_pubip" {
  name                = "azpublicIP"
  location            = azurerm_resource_group.azure_rg.location
  resource_group_name = azurerm_resource_group.azure_rg.name
  allocation_method   = "Dynamic"
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "az_secgp" {
  name                = "azure_NetworkSecurityGroup"
  location            = azurerm_resource_group.azure_rg.location
  resource_group_name = azurerm_resource_group.azure_rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Create network interface
resource "azurerm_network_interface" "az_nic" {
  name                = "azure_nic"
  location            = azurerm_resource_group.azure_rg.location
  resource_group_name = azurerm_resource_group.azure_rg.name
  tags                = {}
  ip_configuration {
    name                          = "azure_NicConfiguration"
    subnet_id                     = azurerm_subnet.az_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.az_pubip.id
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "az_nisga" {
  network_interface_id      = azurerm_network_interface.az_nic.id
  network_security_group_id = azurerm_network_security_group.az_secgp.id
}

# Generate random text for a unique storage account name
resource "random_id" "randomId" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = azurerm_resource_group.azure_rg.name
  }
  byte_length = 8
}

# Create (and display) an SSH key
resource "tls_private_key" "az_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create virtual machine
# resource "azurerm_linux_virtual_machine" "az_linuxvm" {
#   name                  = "azlinuxvm-${random_id.randomId.hex}"
#   location              = azurerm_resource_group.azure_rg.location
#   resource_group_name   = azurerm_resource_group.azure_rg.name
#   network_interface_ids = [azurerm_network_interface.az_nic.id]
#   size                  = "Standard_B1s"
#   os_disk {
#     caching              = "None"
#     storage_account_type = "Standard_LRS"
#   }
#   source_image_reference {
#     publisher = "Debian"
#     offer     = "debian-11"
#     sku       = "11"
#     version   = "latest"
#   }
#   computer_name                   = "linuxvm"
#   admin_username                  = "azureuser"
#   disable_password_authentication = true
#   admin_ssh_key {
#     username   = "azureuser"
#     public_key = tls_private_key.az_ssh_key.public_key_openssh
#   }
# }

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