resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    project     = "MapleBank"
    environment = var.environment
    managed_by  = "terraform"
    purpose     = "sql-private-connectivity"
  }
}

resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.this.name
  address_space       = var.vnet_address_space

  tags = {
    project     = "MapleBank"
    environment = var.environment
    managed_by  = "terraform"
    purpose     = "sql-private-connectivity"
  }
}

resource "azurerm_subnet" "private_endpoint" {
  name                 = var.private_endpoint_subnet_name
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = var.private_endpoint_subnet_address_prefixes
}