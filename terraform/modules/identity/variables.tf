variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "environment" {
  type = string
}

variable "key_vault_id" {
  type = string
}

variable "oidc_issuer_url" {
  type = string
}

variable "kubernetes_namespace" {
  type = string
}

variable "kubernetes_service_account" {
  type = string
}