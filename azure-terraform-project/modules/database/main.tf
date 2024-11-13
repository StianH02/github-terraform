resource "azurerm_resource_group" "db_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_mssql_server" "sql_server" {
  name                         = "${var.sql_server_name}${var.global_suffix}"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
}

resource "azurerm_mssql_database" "sql_database" {
  name         = var.database_name
  server_id    = azurerm_mssql_server.sql_server.id
  collation    = var.collation
  license_type = var.license_type
  max_size_gb  = var.max_size_gb
  sku_name     = var.sku_name
  enclave_type = var.enclave_type

  tags = var.tags

  lifecycle {
    prevent_destroy = true
  }
}