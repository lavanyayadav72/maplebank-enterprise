output "client_id" {
  description = "Client ID of the MapleBank API managed identity"
  value       = azurerm_user_assigned_identity.maplebank_api.client_id
}

output "principal_id" {
  description = "Principal ID of the MapleBank API managed identity"
  value       = azurerm_user_assigned_identity.maplebank_api.principal_id
}

output "identity_id" {
  description = "Resource ID of the MapleBank API managed identity"
  value       = azurerm_user_assigned_identity.maplebank_api.id
}