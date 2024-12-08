resource "azurerm_storage_account" "storageaccount" {
  name                     = "storageaccount65652415425"
  resource_group_name      = local.azurerm_resource_group
  location                 = local.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

 depends_on = [ azurerm_resource_group.rgdetails ]
}