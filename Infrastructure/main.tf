terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.94"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

module "storage_accounts_module" {
  depends_on                        = [azurerm_resource_group.rg]
  source                            = "./storage"
  resource_group_name               = var.resource_group_name
  location                          = var.location
  plate_images_storage_account_name = var.storage_account_plate_images_name
  datalake_storage_account_name     = var.storage_account_name_datalake
  sku                               = var.sku_storage_account
  replication_type                  = var.replication_type_storage_accout
  plate_images_container_name       = var.container_name_plates
  exports_container_name            = var.container_name_exports
}

module "function_app_module" {
  depends_on                        = [azurerm_resource_group.rg, module.storage_accounts_module]
  source                            = "./functionapp"
  resource_group_name               = var.resource_group_name
  location                          = var.location
  storage_account_plate_images_name = var.storage_account_plate_images_name
  storage_account_access_key        = module.storage_accounts_module.primary_access_key
}
