output "east_to_central_peering_id" {
  value = azurerm_virtual_network_peering.east_to_central.id
}

output "central_to_east_peering_id" {
  value = azurerm_virtual_network_peering.central_to_east.id
}