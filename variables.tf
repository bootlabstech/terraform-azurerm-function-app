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


variable "ftps_state" {
  type    = string
  default = "FtpsOnly"

}
variable "app_command_line" {
  type    = string
  default = ""

}
variable "app_scale_limit" {
  type    = number
  default = 1

}
variable "vnet_route_all_enabled" {
  type    = bool
  default = false

}
variable "public_network_access_enabled" {
  type = bool
  default = true
}