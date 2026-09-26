output "server_id" {
  description = "Azure SQL logical server ID"
  value       = azurerm_mssql_server.this.id
}

output "server_name" {
  description = "Azure SQL logical server name"
  value       = azurerm_mssql_server.this.name
}

output "fully_qualified_domain_name" {
  description = "Azure SQL server FQDN"
  value       = azurerm_mssql_server.this.fully_qualified_domain_name
}

output "database_id" {
  description = "Azure SQL database ID"
  value       = azurerm_mssql_database.this.id
}

output "database_name" {
  description = "Azure SQL database name"
  value       = azurerm_mssql_database.this.name
}

output "private_endpoint_id" {
  description = "SQL private endpoint ID"
  value       = azurerm_private_endpoint.sql.id
}

output "private_endpoint_ip" {
  description = "Private IP assigned to the SQL private endpoint"
  value       = azurerm_private_endpoint.sql.private_service_connection[0].private_ip_address
}

output "private_dns_zone_id" {
  description = "SQL private DNS zone ID"
  value       = azurerm_private_dns_zone.sql.id
}