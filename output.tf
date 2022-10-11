output "function_app" {
  description = "The ID of the Function App."
  value       = azurerm_function_app.function_app.default_hostname
}