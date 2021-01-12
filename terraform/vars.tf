variable appgw_rg {
  type        = string
  description = "The Resource Group of the Application Gateway"
}

variable appgw_law_workspace {
  type        = string
  description = "The Log Analytics Workspace of the Application Gateway"
}

variable hw_reportal_rg {
  type        = string
  description = "The Resource Group of the Reportal Service"
}

variable reportal_ai {
  type        = string
  description = "The name of the Reportal Application Insights instance"
}

variable sql_server_name {
  type        = string
  description = "The name of the Azure SQL Server"
}

variable sql_db_name {
  type        = string
  description = "The name of the Azure SQL DB"
}