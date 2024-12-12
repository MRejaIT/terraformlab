output "app_subnetid_output" {
  value = azurerm_subnet.app_subnet.id
}

output "db_subnet_output" {
  value = azurerm_subnet.db_subnet.id
}