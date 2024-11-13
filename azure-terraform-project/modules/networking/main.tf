resource "azurerm_resource_group" "net_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnet_name}${var.global_suffix}" 
  location            = azurerm_resource_group.net_rg.location
  resource_group_name = azurerm_resource_group.net_rg.name
  address_space       = var.address_space
}

resource "azurerm_subnet" "subnet" {
  count                = length(var.subnets)
  name                 = var.subnets[count.index].name
  resource_group_name  = azurerm_resource_group.net_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnets[count.index].address_prefix]
}

resource "azurerm_network_security_group" "nsg" {
  name                = "${var.nsg_name}${var.global_suffix}"
  location            = azurerm_resource_group.net_rg.location
  resource_group_name = azurerm_resource_group.net_rg.name
}