provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "rg" {
  name     = "todo-app-rg"
  location = "East US"
}

resource "azurerm_container_registry" "acr" {
  name                = "todoappacr${random_string.acr_suffix.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "random_string" "acr_suffix" {
  length  = 8
  special = false
  upper   = false
}

resource "azurerm_container_app_environment" "env" {
  name                = "todo-app-env"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Output the ACR login server for use in CI/CD
output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}