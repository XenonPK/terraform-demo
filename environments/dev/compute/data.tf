#data "azurerm_shared_image" "rocky-linux" {
#  for_each = toset(["8", "9"])
#  name     = "Rocky-${each.key}-x86_64"
#
#  gallery_name = "rocky-dc1c6aa6-905b-4d9c-9577-63ccc28c482a"
#  location     = var.azure_location
#}

data "azurerm_virtual_network" "network" {
  name                = "${var.environment}-vnet-${var.azure_networking_id}"
  resource_group_name = "${var.environment}-networking-${var.azure_networking_id}"
}

data "azurerm_subnet" "network" {
  for_each = toset(data.azurerm_virtual_network.network.subnets)

  name                 = each.key
  virtual_network_name = data.azurerm_virtual_network.network.name
  resource_group_name  = "${var.environment}-networking-${var.azure_networking_id}"
}
