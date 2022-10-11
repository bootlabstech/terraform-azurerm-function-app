variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}
variable "location" {
  description = "The Azure Region where the Resource Group should exist."
  type        = string
}

# STORAGE ACCOUNT

variable "storage_name" {
  description = "Specifies the name of the storage account."
  type        = string
}
variable "account_tier" {
  description = "Defines the Tier to use for this storage account."
  type        = string
  default     = "Standard"
}
variable "account_replication_type" {
  description = "Defines the type of replication to use for this storage account."
  type        = string
  default     = "LRS"
}

# APP SERVICE PLAN

variable "plan_name" {
  description = "Specifies the name of the App Service Plan component."
  type        = string
}
variable "tier" {
  description = "Specifies the plan's pricing tier."
  type        = string
}
variable "size" {
  description = "Specifies the plan's instance size."
  type        = string
}
variable "kind" {
  type        = string
  description = "The kind of the App Service Plan to create. Possible values are Windows (also available as App), Linux, elastic (for Premium Consumption) and FunctionApp (for a Consumption Plan). Defaults to Windows."
  default     = "Linux"
}
variable "reserved" {
  type        = bool
  description = "Is this App Service Plan Reserved. Defaults to false."
  default     = true
}

# FUNCTION APP

variable "name" {
  description = "the name of the Function App."
  type        = string
}
variable "functions_worker_runtime" {
  description = "A map of key-value pairs for App Settings and custom values.possible values are dotnet, dotnet-isolated, java, node, powershell, python"
  type        = string
}
variable "os_type" {
  type        = string
  description = "possible values are This value will be linux for Linux derivatives, or an empty string for Windows (default). When set to linux you must also set azurerm_app_service_plan arguments as and reserved = true"
  default     = "linux"
}
variable "java_version" {
  type        = string
  description = "Java version hosted by the function app in Azure. Possible values are 1.8, 11."
  default     = "1.8"
}
