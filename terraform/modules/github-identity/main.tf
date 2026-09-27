resource "azurerm_user_assigned_identity" "github_actions" {
  name                = "id-maplebank-github-actions-${var.environment}"
  location            = var.location
  resource_group_name = var.resource_group_name

  tags = {
    project     = "MapleBank"
    environment = var.environment
    managed_by  = "terraform"
    purpose     = "github-actions-deployment"
  }
}

resource "azurerm_federated_identity_credential" "github_actions" {
  name = "fic-maplebank-github-actions-${var.environment}"

  audience = [
    "api://AzureADTokenExchange"
  ]

  issuer = "https://token.actions.githubusercontent.com"

  subject = "repo:${var.repository}:ref:refs/heads/${var.branch}"

  user_assigned_identity_id = azurerm_user_assigned_identity.github_actions.id
}

resource "azurerm_role_assignment" "acr_push" {
  scope                = var.acr_id
  role_definition_name = "AcrPush"
  principal_id         = azurerm_user_assigned_identity.github_actions.principal_id
}

resource "azurerm_role_assignment" "aks_cluster_user" {
  scope                = var.aks_id
  role_definition_name = "Azure Kubernetes Service Cluster User Role"
  principal_id         = azurerm_user_assigned_identity.github_actions.principal_id
}