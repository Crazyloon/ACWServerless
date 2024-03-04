variable "resource_group_name" {}
variable "location" {}
variable "storage_account_plate_images_name" {}
variable "storage_account_access_key" {}


variable "service_plan_name" {
  description = "The name of the service plan"
  type        = string
  default     = "image-processing-service-plan"
}

variable "os_type" {
  description = "The operating system type"
  type        = string
  default     = "Windows"
}

variable "sku_name" {
  description = "The Service Plan SKU name"
  type        = string
  default     = "Y1"

}

variable "function_app_name" {
  description = "The name of the function app"
  type        = string
  default     = "image-processing-function-app"

}

resource "azurerm_service_plan" "function_app_service_plan" {
  name                = var.service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = var.os_type
  sku_name            = var.sku_name
}

resource "azurerm_windows_function_app" "image_processing_function_app" {
  name                = var.function_app_name
  resource_group_name = var.resource_group_name
  location            = var.location

  storage_account_name       = var.storage_account_plate_images_name
  storage_account_access_key = var.storage_account_access_key
  service_plan_id            = azurerm_service_plan.function_app_service_plan.id

  site_config {}
}