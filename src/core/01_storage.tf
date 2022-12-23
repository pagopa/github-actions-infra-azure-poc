resource "azurerm_resource_group" "data_rg" {
  name     = "${local.project}-data-rg"
  location = var.location

  tags = var.tags
}

module "storage_data" {
  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git//storage_account?ref=fix-storage-account"

  name                            = replace("${local.project}st", "-", "")
  account_kind                    = "StorageV2"
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  access_tier                     = "Hot"
  resource_group_name             = azurerm_resource_group.data_rg.name
  location                        = azurerm_resource_group.data_rg.location
  advanced_threat_protection      = false
  allow_nested_items_to_be_public = false
  enable_low_availability_alert   = false

  tags = var.tags
}
