resource "azurerm_storage_account" "storage_account" {
  name                          = var.storage_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  account_tier                  = var.account_tier
  account_replication_type      = var.account_replication_type
  public_network_access_enabled = false

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

  storage_account_name       = azurerm_storage_account.storage_account.name
  storage_account_access_key = azurerm_storage_account.storage_account.primary_access_key
  service_plan_id            = azurerm_app_service_plan.app_service_plan.id
  
  site_config {
    ftps_state             = var.ftps_state
    app_command_line       = var.app_command_line
    app_scale_limit        = var.app_scale_limit
    vnet_route_all_enabled = var.vnet_route_all_enabled
  }

  depends_on = [ azurerm_app_service_plan.app_service_plan ]

  
}
