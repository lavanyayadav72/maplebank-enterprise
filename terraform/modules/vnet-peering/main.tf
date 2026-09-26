resource "azurerm_virtual_network_peering" "east_to_central" {
  name                      = var.east_to_central_name
  resource_group_name       = var.east_resource_group_name
  virtual_network_name      = var.east_vnet_name
  remote_virtual_network_id = var.central_vnet_id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

resource "azurerm_virtual_network_peering" "central_to_east" {
  name                      = var.central_to_east_name
  resource_group_name       = var.central_resource_group_name
  virtual_network_name      = var.central_vnet_name
  remote_virtual_network_id = var.east_vnet_id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}