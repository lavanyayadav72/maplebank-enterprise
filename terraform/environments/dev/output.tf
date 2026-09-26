output "vnet_id" {
  description = "ID of the MapleBank development VNet"
  value       = module.networking.vnet_id
}

output "vnet_name" {
  description = "Name of the MapleBank development VNet"
  value       = module.networking.vnet_name
}

output "aks_subnet_id" {
  description = "ID of the AKS subnet"
  value       = module.networking.aks_subnet_id
}

output "appgw_subnet_id" {
  description = "ID of the Application Gateway subnet"
  value       = module.networking.appgw_subnet_id
}

output "private_endpoint_subnet_id" {
  description = "ID of the private endpoint subnet"
  value       = module.networking.private_endpoint_subnet_id
}

output "management_subnet_id" {
  description = "ID of the management subnet"
  value       = module.networking.management_subnet_id
}

output "acr_id" {
  description = "ID of the MapleBank development ACR"
  value       = module.acr.acr_id
}

output "acr_name" {
  description = "Name of the MapleBank development ACR"
  value       = module.acr.acr_name
}

output "acr_login_server" {
  description = "Login server of the MapleBank development ACR"
  value       = module.acr.login_server
}

output "identity_client_id" {
  description = "Client ID of the MapleBank API managed identity"
  value       = module.identity.client_id
}