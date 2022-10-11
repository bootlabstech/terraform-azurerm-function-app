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

resource "azurerm_function_app" "function_app" {
  name                       = var.name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  app_service_plan_id        = azurerm_app_service_plan.app_service_plan.id
  storage_account_name       = azurerm_storage_account.storage_account.name
  storage_account_access_key = azurerm_storage_account.storage_account.primary_access_key
  os_type                    = var.os_type

  app_settings = {
    funtions_worker_runtime = var.functions_worker_runtime
  }

  site_config {
    java_version = var.java_version
  }

  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}