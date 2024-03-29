{
  "name": "reportal-dev-dashboard",
  "type": "Microsoft.Portal/dashboards",
  "location": "INSERT LOCATION",
  "tags": {
    "hidden-title": "reportal-dev-dashboard"
  },
  "apiVersion": "2015-08-01-preview",
  "properties": {
    "lenses": {
      "0": {
        "order": 0,
        "parts": {
          "0": {
            "position": {
              "x": 0,
              "y": 0,
              "colSpan": 6,
              "rowSpan": 4
            },
            "metadata": {
              "inputs": [],
              "type": "Extension/HubsExtension/PartType/MarkdownPart",
              "settings": {
                "content": {
                  "settings": {
                    "content": "__Getting Started__\n\nThis dashboard aggregates key data points regarding the Health & Wellness Reportal application for a particular environment (i.e., Dev or Production).\n\nDashboards can be private or shared (in this case shared) to allow reuse across teams. If you would like to adopt a specific view for yourself, feel free to clone this dashboard.\n\nTo learn more about dashboards, check out Microsoft Docs <a href=\"https://docs.microsoft.com/en-us/azure/azure-portal/azure-portal-dashboards\">here</a>.\n\nTo learn more about building your own queries using Kusto for Application Insights or Log Analytics, read more <a href=\"https://docs.microsoft.com/en-us/azure/azure-monitor/log-query/log-query-overview\">here</a>.\n",
                    "title": "How To",
                    "subtitle": "How to use this dashboard",
                    "markdownSource": 1
                  }
                }
              }
            }
          },
          "1": {
            "position": {
              "x": 6,
              "y": 0,
              "colSpan": 6,
              "rowSpan": 5
            },
            "metadata": {
              "inputs": [
                {
                  "name": "ComponentId",
                  "value": "/subscriptions/${subscription_id}/resourcegroups/${appgw_rg}/providers/microsoft.operationalinsights/workspaces/${appgw_law_workspace}",
                  "isOptional": true
                },
                {
                  "name": "Dimensions",
                  "value": {
                    "xAxis": {
                      "name": "TimeGenerated",
                      "type": "datetime"
                    },
                    "yAxis": [
                      {
                        "name": "AggregatedValue",
                        "type": "long"
                      }
                    ],
                    "splitBy": [
                      {
                        "name": "Resource",
                        "type": "string"
                      }
                    ],
                    "aggregation": "Sum"
                  },
                  "isOptional": true
                },
                {
                  "name": "PartId",
                  "value": "[concat(uniquestring(resourceGroup().id), 'FailedReq1'))]",
                  "isOptional": true
                },
                {
                  "name": "Version",
                  "value": "1.0",
                  "isOptional": true
                },
                {
                  "name": "resourceTypeMode",
                  "value": "workspace",
                  "isOptional": true
                },
                {
                  "name": "TimeRange",
                  "value": "P1D",
                  "isOptional": true
                },
                {
                  "name": "DashboardId",
                  "isOptional": true
                },
                {
                  "name": "DraftRequestParameters",
                  "isOptional": true
                },
                {
                  "name": "Query",
                  "value": "// Failed requests per hour \n// Count of requests to which Application Gateway responded with an error. \n// To create an alert for this query, click '+ New alert rule'\nAzureDiagnostics\n| where ResourceType == \"APPLICATIONGATEWAYS\" and OperationName == \"ApplicationGatewayAccess\" and httpStatus_d > 399\n| where originalRequestUriWithArgs_s contains \"/reportal/\"\n| summarize AggregatedValue = count() by bin(TimeGenerated, 1h), Resource\n| render timechart\n\n",
                  "isOptional": true
                },
                {
                  "name": "ControlType",
                  "value": "FrameControlChart",
                  "isOptional": true
                },
                {
                  "name": "SpecificChart",
                  "value": "Line",
                  "isOptional": true
                },
                {
                  "name": "PartTitle",
                  "value": "Analytics",
                  "isOptional": true
                },
                {
                  "name": "PartSubTitle",
                  "value": "${appgw_law_workspace}",
                  "isOptional": true
                }
              ],
              "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
              "settings": {
                "content": {
                  "PartTitle": "Failed Requests",
                  "PartSubTitle": "Application Gateway"
                }
              }
            }
          },
          "2": {
            "position": {
              "x": 12,
              "y": 0,
              "colSpan": 6,
              "rowSpan": 5
            },
            "metadata": {
              "inputs": [
                {
                  "name": "ComponentId",
                  "value": "/subscriptions/${subscription_id}/resourceGroups/${hw_reportal_rg}/providers/Microsoft.Insights/components/${reportal_ai}"
                }
              ],
              "type": "Extension/AppInsightsExtension/PartType/AppMapGalPt",
              "settings": {},
              "asset": {
                "idInputName": "ComponentId",
                "type": "ApplicationInsights"
              }
            }
          },
          "3": {
            "position": {
              "x": 0,
              "y": 4,
              "colSpan": 6,
              "rowSpan": 5
            },
            "metadata": {
              "inputs": [
                {
                  "name": "options",
                  "value": {
                    "chart": {
                      "metrics": [
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/${subscription_id}/resourceGroups/${hw_reportal_rg}/providers/Microsoft.Sql/servers/${sql_server_name}/databases/${sql_db_name}"
                          },
                          "name": "cpu_percent",
                          "aggregationType": 3,
                          "metricVisualization": {
                            "displayName": "CPU percentage",
                            "resourceDisplayName": "${sql_server_name}/${sql_db_name}"
                          }
                        },
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/${subscription_id}/resourceGroups/${hw_reportal_rg}/providers/Microsoft.Sql/servers/${sql_server_name}/databases/${sql_db_name}"
                          },
                          "name": "physical_data_read_percent",
                          "aggregationType": 3,
                          "metricVisualization": {
                            "displayName": "Data IO percentage",
                            "resourceDisplayName": "${sql_server_name}/${sql_db_name}"
                          }
                        },
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/${subscription_id}/resourceGroups/${hw_reportal_rg}/providers/Microsoft.Sql/servers/${sql_server_name}/databases/${sql_db_name}"
                          },
                          "name": "log_write_percent",
                          "aggregationType": 3,
                          "metricVisualization": {
                            "displayName": "Log IO percentage",
                            "resourceDisplayName": "${sql_server_name}/${sql_db_name}"
                          }
                        }
                      ],
                      "title": "Compute utilization",
                      "titleKind": 2,
                      "visualization": {
                        "chartType": 2
                      },
                      "openBladeOnClick": {
                        "openBlade": true
                      }
                    }
                  },
                  "isOptional": true
                },
                {
                  "name": "sharedTimeRange",
                  "isOptional": true
                }
              ],
              "type": "Extension/HubsExtension/PartType/MonitorChartPart",
              "settings": {
                "content": {
                  "options": {
                    "chart": {
                      "metrics": [
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/${subscription_id}/resourceGroups/${hw_reportal_rg}/providers/Microsoft.Sql/servers/${sql_server_name}/databases/${sql_db_name}"
                          },
                          "name": "cpu_percent",
                          "aggregationType": 3,
                          "metricVisualization": {
                            "displayName": "CPU percentage",
                            "resourceDisplayName": "${sql_server_name}/${sql_db_name}"
                          }
                        },
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/${subscription_id}/resourceGroups/${hw_reportal_rg}/providers/Microsoft.Sql/servers/${sql_server_name}/databases/${sql_db_name}"
                          },
                          "name": "physical_data_read_percent",
                          "aggregationType": 3,
                          "metricVisualization": {
                            "displayName": "Data IO percentage",
                            "resourceDisplayName": "${sql_server_name}/${sql_db_name}"
                          }
                        },
                        {
                          "resourceMetadata": {
                            "id": "/subscriptions/${subscription_id}/resourceGroups/${hw_reportal_rg}/providers/Microsoft.Sql/servers/${sql_server_name}/databases/${sql_db_name}"
                          },
                          "name": "log_write_percent",
                          "aggregationType": 3,
                          "metricVisualization": {
                            "displayName": "Log IO percentage",
                            "resourceDisplayName": "${sql_server_name}/${sql_db_name}"
                          }
                        }
                      ],
                      "title": "Compute utilization",
                      "titleKind": 2,
                      "visualization": {
                        "chartType": 2,
                        "disablePinning": true
                      },
                      "openBladeOnClick": {
                        "openBlade": true
                      }
                    }
                  }
                }
              }
            }
          },
          "4": {
            "position": {
              "x": 6,
              "y": 5,
              "colSpan": 12,
              "rowSpan": 4
            },
            "metadata": {
              "inputs": [
                {
                  "name": "ComponentId",
                  "value": "/subscriptions/${subscription_id}/resourceGroups/${hw_reportal_rg}/providers/Microsoft.Insights/components/${reportal_ai}",
                  "isOptional": true
                },
                {
                  "name": "Dimensions",
                  "isOptional": true
                },
                {
                  "name": "PartId",
                  "value": "[concat(uniquestring(resourceGroup().id), 'Last100Except1'))]",
                  "isOptional": true
                },
                {
                  "name": "Version",
                  "value": "1.0",
                  "isOptional": true
                },
                {
                  "name": "resourceTypeMode",
                  "value": "components",
                  "isOptional": true
                },
                {
                  "name": "TimeRange",
                  "isOptional": true
                },
                {
                  "name": "DashboardId",
                  "isOptional": true
                },
                {
                  "name": "DraftRequestParameters",
                  "isOptional": true
                },
                {
                  "name": "Query",
                  "value": "traces \n| where severityLevel == 3\n| where customDimensions.LoggerName != 'com.azure.identity.EnvironmentCredential'\n| where customDimensions.LoggerName != 'com.azure.identity.implementation.IntelliJCacheAccessor'\n| where customDimensions.LoggerName != 'com.azure.identity.implementation.MSIToken'\n| where timestamp > ago(7d)\n| top 100 by timestamp desc\n\n",
                  "isOptional": true
                },
                {
                  "name": "ControlType",
                  "value": "AnalyticsGrid",
                  "isOptional": true
                },
                {
                  "name": "SpecificChart",
                  "isOptional": true
                },
                {
                  "name": "PartTitle",
                  "value": "Analytics",
                  "isOptional": true
                },
                {
                  "name": "PartSubTitle",
                  "value": "reportal-dev-ai",
                  "isOptional": true
                }
              ],
              "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
              "settings": {
                "content": {
                  "GridColumnsWidth": {
                    "message": "725px",
                    "class": "322px"
                  },
                  "Query": "traces \n| where severityLevel == 3\n| where customDimensions.LoggerName != 'com.azure.identity.EnvironmentCredential'\n| where customDimensions.LoggerName != 'com.azure.identity.implementation.IntelliJCacheAccessor'\n| where customDimensions.LoggerName != 'com.azure.identity.implementation.MSIToken'\n| top 100 by timestamp desc\n| project timestamp, class=customDimensions.LoggerName, message",
                  "PartTitle": "Last 100 Exceptions",
                  "PartSubTitle": "Application Insights"
                }
              }
            }
          },
          "5": {
            "position": {
              "x": 0,
              "y": 9,
              "colSpan": 6,
              "rowSpan": 4
            },
            "metadata": {
              "inputs": [
                {
                  "name": "ComponentId",
                  "value": "/subscriptions/${subscription_id}/resourceGroups/${hw_reportal_rg}/providers/Microsoft.Insights/components/${reportal_ai}",
                  "isOptional": true
                },
                {
                  "name": "Dimensions",
                  "value": {
                    "xAxis": {
                      "name": "timestamp",
                      "type": "datetime"
                    },
                    "yAxis": [
                      {
                        "name": "totalCount",
                        "type": "long"
                      }
                    ],
                    "splitBy": [],
                    "aggregation": "Sum"
                  },
                  "isOptional": true
                },
                {
                  "name": "PartId",
                  "value": "[concat(uniquestring(resourceGroup().id), 'TotalAPI1'))]",
                  "isOptional": true
                },
                {
                  "name": "Version",
                  "value": "1.0",
                  "isOptional": true
                },
                {
                  "name": "resourceTypeMode",
                  "value": "components",
                  "isOptional": true
                },
                {
                  "name": "TimeRange",
                  "value": "P1D",
                  "isOptional": true
                },
                {
                  "name": "DashboardId",
                  "isOptional": true
                },
                {
                  "name": "DraftRequestParameters",
                  "isOptional": true
                },
                {
                  "name": "Query",
                  "value": "// Request count trend \n// Chart Request count over the last day. \n// To create an alert for this query, click '+ New alert rule'\nrequests\n| where url contains_cs \"/api/\"\n| summarize totalCount=sum(itemCount) by bin(timestamp, 30m)\n| render timechart\n\n",
                  "isOptional": true
                },
                {
                  "name": "ControlType",
                  "value": "FrameControlChart",
                  "isOptional": true
                },
                {
                  "name": "SpecificChart",
                  "value": "Line",
                  "isOptional": true
                },
                {
                  "name": "PartTitle",
                  "value": "Analytics",
                  "isOptional": true
                },
                {
                  "name": "PartSubTitle",
                  "value": "reportal-dev-ai",
                  "isOptional": true
                }
              ],
              "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
              "settings": {
                "content": {
                  "Query": "// Request count trend \n// Chart Request count over the last day. \n// To create an alert for this query, click '+ New alert rule'\nrequests\n| where url contains_cs \"/api/\"\n| summarize totalCount=sum(itemCount) by bin(timestamp, 1h)\n| render timechart with (ytitle='Request Count', xtitle='Time', title=\"API requests\")\n\n",
                  "PartTitle": "Total API Requests",
                  "PartSubTitle": "Application Insights"
                }
              }
            }
          },
          "6": {
            "position": {
              "x": 6,
              "y": 9,
              "colSpan": 6,
              "rowSpan": 4
            },
            "metadata": {
              "inputs": [
                {
                  "name": "ComponentId",
                  "value": "/subscriptions/${subscription_id}/resourceGroups/${hw_reportal_rg}/providers/Microsoft.Insights/components/${reportal_ai}",
                  "isOptional": true
                },
                {
                  "name": "Dimensions",
                  "value": {
                    "xAxis": {
                      "name": "timestamp",
                      "type": "datetime"
                    },
                    "yAxis": [
                      {
                        "name": "count_",
                        "type": "long"
                      }
                    ],
                    "splitBy": [],
                    "aggregation": "Sum"
                  },
                  "isOptional": true
                },
                {
                  "name": "PartId",
                  "value": "[concat(uniquestring(resourceGroup().id), 'ThrownExcept1'))]",
                  "isOptional": true
                },
                {
                  "name": "Version",
                  "value": "1.0",
                  "isOptional": true
                },
                {
                  "name": "resourceTypeMode",
                  "value": "components",
                  "isOptional": true
                },
                {
                  "name": "TimeRange",
                  "isOptional": true
                },
                {
                  "name": "DashboardId",
                  "isOptional": true
                },
                {
                  "name": "DraftRequestParameters",
                  "isOptional": true
                },
                {
                  "name": "Query",
                  "value": "traces \n| where severityLevel == 3\n| where customDimensions.LoggerName != 'com.azure.identity.EnvironmentCredential'\n| where customDimensions.LoggerName != 'com.azure.identity.implementation.IntelliJCacheAccessor'\n| where customDimensions.LoggerName != 'com.azure.identity.implementation.MSIToken'\n| where timestamp > ago(1d)\n| summarize count() by bin(timestamp, 1h)\n| render columnchart with (ytitle='Exception Count', xtitle='Time', title=\"Exceptions (last 24hrs)\")\n",
                  "isOptional": true
                },
                {
                  "name": "ControlType",
                  "value": "FrameControlChart",
                  "isOptional": true
                },
                {
                  "name": "SpecificChart",
                  "value": "StackedColumn",
                  "isOptional": true
                },
                {
                  "name": "PartTitle",
                  "value": "Exceptions (last 24hrs)",
                  "isOptional": true
                },
                {
                  "name": "PartSubTitle",
                  "value": "${reportal_ai}",
                  "isOptional": true
                }
              ],
              "type": "Extension/Microsoft_OperationsManagementSuite_Workspace/PartType/LogsDashboardPart",
              "settings": {
                "content": {
                  "Query": "traces \n| where severityLevel == 3\n| where customDimensions.LoggerName != 'com.azure.identity.EnvironmentCredential'\n| where customDimensions.LoggerName != 'com.azure.identity.implementation.IntelliJCacheAccessor'\n| where customDimensions.LoggerName != 'com.azure.identity.implementation.MSIToken'\n| summarize count() by bin(timestamp, 1h)\n| render columnchart with (ytitle='Exception Count', xtitle='Time', title=\"Exceptions\")\n",
                  "PartTitle": "Thrown Exception Count",
                  "PartSubTitle": "Application Insights"
                }
              }
            }
          }
        }
      }
    },
    "metadata": {
      "model": {
        "timeRange": {
          "value": {
            "relative": {
              "duration": 24,
              "timeUnit": 1
            }
          },
          "type": "MsPortalFx.Composition.Configuration.ValueTypes.TimeRange"
        },
        "filterLocale": {
          "value": "en-us"
        },
        "filters": {
          "value": {
            "MsPortalFx_TimeRange": {
              "model": {
                "format": "utc",
                "granularity": "auto",
                "relative": "24h"
              },
              "displayCache": {
                "name": "UTC Time",
                "value": "Past 24 hours"
              }
            }
          }
        }
      }
    }
  }
}
