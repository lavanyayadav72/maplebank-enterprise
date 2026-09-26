variable "resource_group_name" {
  description = "Resource group for the AKS cluster"
  type        = string
}

variable "location" {
  description = "Azure region for the AKS cluster"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
}

variable "vm_size" {
  description = "VM size for the AKS system node"
  type        = string
}

variable "aks_subnet_id" {
  description = "ID of the existing AKS subnet"
  type        = string
}

variable "acr_id" {
  description = "ID of the Azure Container Registry"
  type        = string
}

variable "application_gateway_id" {
  description = "Resource ID of the Application Gateway used by AGIC"
  type        = string
}