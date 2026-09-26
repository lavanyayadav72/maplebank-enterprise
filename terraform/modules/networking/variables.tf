variable "resource_group_name" {
  description = "Resource group for networking resources"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space of the virtual network"
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