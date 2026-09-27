output "client_id" {
  value = azurerm_user_assigned_identity.github_actions.client_id
}

output "principal_id" {
  value = azurerm_user_assigned_identity.github_actions.principal_id
}