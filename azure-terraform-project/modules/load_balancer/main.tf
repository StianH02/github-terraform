resource "azurerm_resource_group" "lb_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_public_ip" "lb_public_ip" {
  name                = "${var.public_ip_name}${var.global_suffix}"
  location            = azurerm_resource_group.lb_rg.location
  resource_group_name = azurerm_resource_group.lb_rg.name
  allocation_method   = "Static"
}

resource "azurerm_lb" "load_balancer" {
  name                = "${var.load_balancer_name}${var.global_suffix}"
  location            = azurerm_resource_group.lb_rg.location
  resource_group_name = azurerm_resource_group.lb_rg.name

  frontend_ip_configuration {
    name                 = var.frontend_ip_name
    public_ip_address_id = azurerm_public_ip.lb_public_ip.id
  }
}
