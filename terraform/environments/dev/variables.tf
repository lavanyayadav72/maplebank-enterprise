variable "resource_group_name" {
  description = "Name of the maplebank development resource group"
  type        = string
}

variable "location" {
  description = "Azure region for the development environment"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "vnet_name" {
  description = "Name of the MapleBank development VNet"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space for the MapleBank development VNet"
  type        = list(string)
}

variable "aks_subnet_name" {
  description = "Name of the AKS subnet"
  type        = string
}

variable "aks_subnet_address_prefixes" {
  description = "Address range for the AKS subnet"
  type        = list(string)
}
variable "appgw_subnet_name" {
  description = "Name of the Application Gateway subnet"
  type        = string
}

variable "appgw_subnet_address_prefixes" {
  description = "Address range for the Application Gateway subnet"
  type        = list(string)
}

variable "private_endpoint_subnet_name" {
  description = "Name of the private endpoint subnet"
  type        = string
}

variable "private_endpoint_subnet_address_prefixes" {
  description = "Address range for the private endpoint subnet"
  type        = list(string)
}

variable "management_subnet_name" {
  description = "Name of the management subnet"
  type        = string
}

variable "management_subnet_address_prefixes" {
  description = "Address range for the management subnet"
  type        = list(string)
}

variable "acr_name" {
  description = "Globally unique Azure Container Registry name"
  type        = string
}

variable "aks_cluster_name" {
  description = "Name of the MapleBank AKS cluster"
  type        = string
}

variable "aks_dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
}

variable "aks_vm_size" {
  description = "VM size for the AKS system node"
  type        = string
}

variable "appgw_name" {
  description = "Name of the MapleBank Application Gateway"
  type        = string
}

variable "appgw_public_ip_name" {
  description = "Name of the Application Gateway public IP"
  type        = string
}

variable "key_vault_name" {
  description = "Name of the MapleBank Key Vault"
  type        = string
}

variable "sql_server_name" {
  type = string
}

variable "sql_database_name" {
  type = string
}

variable "sql_administrator_login" {
  type = string
}

variable "sql_administrator_login_password" {
  type      = string
  sensitive = true
}

variable "sql_database_sku_name" {
  type    = string
  default = "Basic"
}

variable "sql_private_endpoint_name" {
  type = string
}