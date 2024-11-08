module "avm-res-network-virtualnetwork" {
  source  = "Azure/avm-res-network-virtualnetwork/azurerm"
  version = "0.6.0"
  # insert the 3 required variables here

  name                = "${var.environment}-vnet-${random_string.networking-identifier.result}"
  location            = azurerm_resource_group.networking-rg.location
  resource_group_name = azurerm_resource_group.networking-rg.name
  address_space       = ["172.16.20.0/22"]
}
