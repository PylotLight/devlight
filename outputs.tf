#Azure outputs
output "resource_group_name" {
  value     = azurerm_resource_group.azure_rg.name
  sensitive = true
}

output "public_ip_address" {
  value     = azurerm_linux_virtual_machine.az_linuxvm.public_ip_address
  sensitive = true
}

output "tls_private_key" {
  value     = tls_private_key.az_ssh_key.private_key_pem
  sensitive = true
}