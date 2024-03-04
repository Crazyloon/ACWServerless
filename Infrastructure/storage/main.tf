variable "resource_group_name" {}
variable "location" {}
variable "plate_images_storage_account_name" {}
variable "datalake_storage_account_name" {}
variable "sku" {}
variable "replication_type" {}
variable "plate_images_container_name" {}
variable "exports_container_name" {}

resource "azurerm_storage_account" "storage_account_plate_images" {
  name                            = var.plate_images_storage_account_name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  account_replication_type        = var.replication_type
  account_tier                    = var.sku
  allow_nested_items_to_be_public = false
  shared_access_key_enabled       = true
}

resource "azurerm_storage_account" "storage_account_exports" {
  name                     = var.datalake_storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_replication_type = var.replication_type
  account_tier             = var.sku
  is_hns_enabled           = true
}

resource "azurerm_storage_container" "container_plates" {
  depends_on            = [azurerm_storage_account.storage_account_plate_images]
  name                  = var.plate_images_container_name
  storage_account_name  = var.plate_images_storage_account_name
  container_access_type = "private"
}

resource "azurerm_storage_container" "container_exports" {
  depends_on            = [azurerm_storage_account.storage_account_exports]
  name                  = var.exports_container_name
  storage_account_name  = var.datalake_storage_account_name
  container_access_type = "private"
}
