output "primary_access_key" {
  value       = azurerm_storage_account.storage_account_plate_images.primary_access_key
  description = "value of the primary access key for the plate images storage account"
  sensitive   = true
}