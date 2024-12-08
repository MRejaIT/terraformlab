resource "azurerm_app_service_plan" "apppaln" {
  name                = "demo-app-plan5465256"
  location            = local.location
  resource_group_name = local.azurerm_resource_group

  sku {
    tier = "Standard"
    size = "S1"
  }
  depends_on = [ azurerm_resource_group.rgdetails ]
}