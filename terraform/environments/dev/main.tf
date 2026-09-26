resource "azurerm_resource_group" "maplebank" {
  name     = var.resource_group_name
  location = var.location

  tags = {
    project     = "MapleBank"
    environment = var.environment
    managed_by  = "terraform"
  }
}

module "keyvault" {
  source = "../../modules/keyvault"

  resource_group_name = azurerm_resource_group.maplebank.name
  location            = var.location
  environment         = var.environment
  name                = var.key_vault_name
}

module "networking" {
  source = "../../modules/networking"

  resource_group_name = azurerm_resource_group.maplebank.name
  location            = var.location
  environment         = var.environment

  vnet_name          = var.vnet_name
  vnet_address_space = var.vnet_address_space

  aks_subnet_name             = var.aks_subnet_name
  aks_subnet_address_prefixes = var.aks_subnet_address_prefixes

  appgw_subnet_name             = var.appgw_subnet_name
  appgw_subnet_address_prefixes = var.appgw_subnet_address_prefixes

  private_endpoint_subnet_name             = var.private_endpoint_subnet_name
  private_endpoint_subnet_address_prefixes = var.private_endpoint_subnet_address_prefixes

  management_subnet_name             = var.management_subnet_name
  management_subnet_address_prefixes = var.management_subnet_address_prefixes
}

moved {
  from = azurerm_virtual_network.maplebank
  to   = module.networking.azurerm_virtual_network.this
}

moved {
  from = azurerm_subnet.aks
  to   = module.networking.azurerm_subnet.aks
}

moved {
  from = azurerm_subnet.appgw
  to   = module.networking.azurerm_subnet.appgw
}

moved {
  from = azurerm_subnet.private_endpoint
  to   = module.networking.azurerm_subnet.private_endpoint
}

moved {
  from = azurerm_subnet.management
  to   = module.networking.azurerm_subnet.management
}

moved {
  from = azurerm_network_security_group.aks
  to   = module.networking.azurerm_network_security_group.aks
}

moved {
  from = azurerm_subnet_network_security_group_association.aks
  to   = module.networking.azurerm_subnet_network_security_group_association.aks
}

module "acr" {
  source = "../../modules/acr"

  resource_group_name = azurerm_resource_group.maplebank.name
  location            = var.location
  environment         = var.environment
  acr_name            = var.acr_name
}

module "appgw" {
  source = "../../modules/appgw"

  resource_group_name = azurerm_resource_group.maplebank.name
  location            = var.location
  environment         = var.environment

  name           = var.appgw_name
  public_ip_name = var.appgw_public_ip_name
  subnet_id      = module.networking.appgw_subnet_id
}

module "aks" {
  source = "../../modules/aks"

  resource_group_name = azurerm_resource_group.maplebank.name
  location            = var.location
  environment         = var.environment

  cluster_name = var.aks_cluster_name
  dns_prefix   = var.aks_dns_prefix
  vm_size      = var.aks_vm_size

  aks_subnet_id = module.networking.aks_subnet_id
  acr_id        = module.acr.acr_id

  application_gateway_id = module.appgw.id
}

module "identity" {
  source = "../../modules/identity"

  resource_group_name = azurerm_resource_group.maplebank.name
  location            = var.location
  environment         = var.environment

  key_vault_id = module.keyvault.id

  oidc_issuer_url = module.aks.oidc_issuer_url

  kubernetes_namespace       = "maplebank-dev"
  kubernetes_service_account = "maplebank-api-sa"
}

module "sql_network" {
  source = "../../modules/sql-network"

  resource_group_name = "rg-maplebank-sql-centralus-001"
  location            = "centralus"
  environment         = var.environment

  vnet_name          = "vnet-maplebank-sql-centralus-001"
  vnet_address_space = ["10.20.0.0/16"]

  private_endpoint_subnet_name             = "snet-maplebank-sql-pe-001"
  private_endpoint_subnet_address_prefixes = ["10.20.1.0/24"]
}

module "sql_vnet_peering" {
  source = "../../modules/vnet-peering"

  east_to_central_name = "peer-maplebank-eastus-to-centralus"
  central_to_east_name = "peer-maplebank-centralus-to-eastus"

  east_resource_group_name    = azurerm_resource_group.maplebank.name
  central_resource_group_name = module.sql_network.resource_group_name

  east_vnet_name    = module.networking.vnet_name
  central_vnet_name = module.sql_network.vnet_name

  east_vnet_id    = module.networking.vnet_id
  central_vnet_id = module.sql_network.vnet_id
}


module "sql" {
  source = "../../modules/sql"

  resource_group_name = module.sql_network.resource_group_name
  location            = "centralus"
  environment         = var.environment

  server_name                  = var.sql_server_name
  database_name                = var.sql_database_name
  administrator_login          = var.sql_administrator_login
  administrator_login_password = var.sql_administrator_login_password
  database_sku_name            = var.sql_database_sku_name

  private_endpoint_name      = var.sql_private_endpoint_name
  private_endpoint_subnet_id = module.sql_network.private_endpoint_subnet_id
  vnet_id                    = module.sql_network.vnet_id

  application_vnet_id = module.networking.vnet_id
}