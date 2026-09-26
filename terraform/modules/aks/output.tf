output "aks_id" {
  description = "ID of the MapleBank AKS cluster"
  value       = azurerm_kubernetes_cluster.this.id
}

output "aks_name" {
  description = "Name of the MapleBank AKS cluster"
  value       = azurerm_kubernetes_cluster.this.name
}

output "kubelet_identity_object_id" {
  description = "Object ID of the AKS kubelet managed identity"
  value       = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
}

output "oidc_issuer_url" {
  description = "OIDC issuer URL for AKS Workload Identity"
  value       = azurerm_kubernetes_cluster.this.oidc_issuer_url
}