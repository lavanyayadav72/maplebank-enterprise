variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "environment" {
  type = string
}

variable "repository" {
  type = string
}

variable "branch" {
  type    = string
  default = "main"
}

variable "acr_id" {
  type = string
}

variable "aks_id" {
  type = string
}
