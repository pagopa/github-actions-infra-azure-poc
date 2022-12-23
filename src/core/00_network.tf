resource "azurerm_resource_group" "network_rg" {
  name     = "${local.project}-network-rg"
  location = var.location

  tags = var.tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${local.project}-vnet"
  resource_group_name = azurerm_resource_group.network_rg.name
  location            = var.location
  address_space       = var.vnet_address_space

  tags = var.tags
}

resource "azurerm_private_dns_zone" "privatelink_blob_core_windows_net" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = azurerm_resource_group.network_rg.name

  tags = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "privatelink_blob_core_windows_net_vnet" {
  name                  = azurerm_virtual_network.vnet.name
  resource_group_name   = azurerm_resource_group.network_rg.name
  private_dns_zone_name = azurerm_private_dns_zone.privatelink_blob_core_windows_net.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
  registration_enabled  = false

  tags = var.tags
}
