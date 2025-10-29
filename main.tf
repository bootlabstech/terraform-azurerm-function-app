resource "azurerm_storage_account" "storage_account" {
  name                          = var.storage_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  account_tier                  = var.account_tier
  account_replication_type      = var.account_replication_type
  public_network_access_enabled = var.public_network_access_enabled

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  kind                = var.kind
  reserved            = var.reserved

  sku {
    tier = var.tier
    size = var.size
  }

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}

resource "azurerm_linux_function_app" "example" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_network_subnet_id = var.virtual_network_subnet_id

  storage_account_name       = azurerm_storage_account.storage_account.name
  storage_account_access_key = azurerm_storage_account.storage_account.primary_access_key
  service_plan_id            = azurerm_app_service_plan.app_service_plan.id
  
  site_config {
    ftps_state             = var.ftps_state
    app_command_line       = var.app_command_line
    app_scale_limit        = var.app_scale_limit
    vnet_route_all_enabled = var.vnet_route_all_enabled

    dynamic "application_stack" {
      for_each = (
       var.runtime_stack == "python" || 
       var.runtime_stack == "node" || 
       var.runtime_stack == "dotnet" || 
       var.runtime_stack == "java"
       ) ? [1] : []

      content {
        python_version            = var.runtime_stack == "python" ? var.runtime_version : null
        node_version              = var.runtime_stack == "node" ? var.runtime_version : null
        dotnet_version            = var.runtime_stack == "dotnet" ? var.runtime_version : null
        java_version              = var.runtime_stack == "java" ? var.runtime_version : null
      }
    }
  }

  depends_on = [ azurerm_app_service_plan.app_service_plan ]

  
}