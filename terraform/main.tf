resource "azurerm_dashboard" "my-board" {
  name                = "my-cool-dashboard"
  resource_group_name = azurerm_resource_group.my-group.name
  location            = azurerm_resource_group.my-group.location
  tags = {
    source = "terraform"
  }
dashboard_properties = templatefile("dash.tpl",
    {
      appgw_rg = var.appgwrg
      appgw_law_workspace = var.appgw_law_workspace
      hw_reportal_rg = var.hw_reportal_rg
      reportal_ai = var.reportal_ai
      sql_server_name = var.sql_server_name
      sql_db_name = var.sql_db_name
      sub_id     = data.azurerm_subscription.current.subscription_id
  })
}