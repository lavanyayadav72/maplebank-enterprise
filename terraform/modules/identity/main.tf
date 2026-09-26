resource "azurerm_user_assigned_identity" "maplebank_api" {
  name                = "id-maplebank-api-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = {
    project     = "MapleBank"
    environment = var.environment
    managed_by  = "terraform"
  }
}

resource "azurerm_role_assignment" "key_vault_secrets_user" {
  scope                = var.key_vault_id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azurerm_user_assigned_identity.maplebank_api.principal_id
}

resource "azurerm_federated_identity_credential" "maplebank_api" {
  name = "fic-maplebank-api-${var.environment}"

  audience = [
    "api://AzureADTokenExchange"
  ]

  issuer = var.oidc_issuer_url

  subject = "system:serviceaccount:${var.kubernetes_namespace}:${var.kubernetes_service_account}"

  user_assigned_identity_id = azurerm_user_assigned_identity.maplebank_api.id
}