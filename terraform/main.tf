locals {
  azure_asset_names = {
    azurerm_resource_group = "test-kroger"
  }
  common_tags = {
  }
}

provider "azurerm" {
  version                    = ">=2.25.0"
  skip_provider_registration = "true"

  features {
    key_vault {
      recover_soft_deleted_key_vaults = true
    }
  }
}

resource "azurerm_dashboard" "my-board" {
  name                = "my-cool-dashboard"
  resource_group_name = local.azure_asset_names.azurerm_resource_group
  location            = "eastus"
  tags = {
    source = "terraform"
  }
  dashboard_properties = templatefile("dash.tpl",
    {
      appgw_rg            = var.appgw_rg
      appgw_law_workspace = var.appgw_law_workspace
      hw_reportal_rg      = var.hw_reportal_rg
      reportal_ai         = var.reportal_ai
      sql_server_name     = var.sql_server_name
      sql_db_name         = var.sql_db_name
      subscription_id     = var.subscription_id
  })
}