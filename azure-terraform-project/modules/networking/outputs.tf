/*output "vnet_id" {
  description = "The ID of the Virtual Network."
  value       = azurerm_virtual_network.vnet.id
}

output "subnet_ids" {
  description = "List of subnet IDs."
  value       = [for subnet in azurerm_subnet.subnet : subnet.id]
}

output "resource_group_name" {
  description = "The name of the resource group for networking."
  value       = azurerm_resource_group.networking.name
}*/