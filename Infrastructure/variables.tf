variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "CrazyloonServerless"
}

variable "location" {
  description = "The location of the resource group"
  type        = string
  default     = "westus"
}

variable "storage_account_plate_images_name" {
  description = "The name of the storage account for license plate images"
  type        = string
  default     = "plateimages2024"
}

variable "storage_account_name_datalake" {
  description = ""
  type        = string
  default     = "datalakeexports2024"
}

variable "sku_storage_account" {
  description = ""
  type        = string
  default     = "Standard"
}

variable "replication_type_storage_accout" {
  description = "Locally Redudnat Storage (LRS)"
  type        = string
  default     = "LRS"
}

variable "container_name_plates" {
  description = ""
  type        = string
  default     = "plateimages"
}

variable "container_name_exports" {
  description = ""
  type        = string
  default     = "exports"
}
