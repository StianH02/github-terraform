resource "azurerm_resource_group" "as_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_service_plan" "app_service_plan" {
  name                = "${var.app_service_plan_name}${var.global_suffix}"
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = var.app_service_plan_sku_name
}

resource "azurerm_linux_web_app" "app_service" {
  name                = "${var.app_service_name}${var.global_suffix}"
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.app_service_plan.id

  site_config {
  }
}
