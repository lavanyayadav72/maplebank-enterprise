variable "resource_group_name" {
  description = "Resource group for the container registry"
  type        = string
}

variable "location" {
  description = "Azure region for the container registry"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
}

variable "acr_name" {
  description = "Globally unique Azure Container Registry name"
  type        = string
}