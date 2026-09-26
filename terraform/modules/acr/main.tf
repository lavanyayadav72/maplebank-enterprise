resource "azurerm_container_registry" "this" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku           = "Basic"
  admin_enabled = false

  public_network_access_enabled = true

  tags = {
    project     = "MapleBank"
    environment = var.environment
    managed_by  = "terraform"
  }
}
