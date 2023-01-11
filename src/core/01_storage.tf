resource "azurerm_resource_group" "data_rg" {
  name     = "${local.project}-data-rg"
  location = var.location

  tags = var.tags
}

module "storage_data" {
  source = "git::https://github.com/pagopa/terraform-azurerm-v3.git//storage_account?ref=v3.4.4"

  name                            = replace("${local.project}datast", "-", "")
  account_kind                    = "StorageV2"
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  access_tier                     = "Hot"
  resource_group_name             = azurerm_resource_group.data_rg.name
  location                        = azurerm_resource_group.data_rg.location
  advanced_threat_protection      = false
  allow_nested_items_to_be_public = false
  enable_low_availability_alert   = false

  network_rules = {
    default_action = "Deny"
    ip_rules       = []
    bypass = [
      "Logging",
      # "Metrics",
      # "AzureServices",
    ]
    virtual_network_subnet_ids = []
  }

  tags = var.tags
}

resource "azurerm_storage_container" "storage_data_private_container" {
  name                  = "private-container"
  storage_account_name  = module.storage_data.name
  container_access_type = "private"
}

resource "azurerm_private_endpoint" "storage_data_blob" {
  name                = "${module.storage_data.name}-blob-endpoint"
  location            = azurerm_resource_group.data_rg.location
  resource_group_name = azurerm_resource_group.data_rg.name
  subnet_id           = azurerm_subnet.private_endpoints_snet.id

  private_service_connection {
    name                           = "${module.storage_data.name}-blob"
    private_connection_resource_id = module.storage_data.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }

  private_dns_zone_group {
    name                 = "private-dns-zone-group"
    private_dns_zone_ids = [azurerm_private_dns_zone.privatelink_blob_core_windows_net.id]
  }

  tags = var.tags
}
