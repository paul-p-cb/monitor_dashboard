resource "azurerm_dashboard" "my-board" {
  name                = "my-cool-dashboard"
  resource_group_name = azurerm_resource_group.my-group.name
  location            = azurerm_resource_group.my-group.location
  tags = {
    source = "terraform"
  }
  dashboard_properties = <<DASH
{
}
  DASH
}