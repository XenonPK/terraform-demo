resource "random_string" "networking-identifier" {
  length  = 4
  special = false
  numeric = false
  lower   = true
  upper   = false
}

resource "azurerm_resource_group" "networking-rg" {
  name     = "${var.environment}-networking-${random_string.networking-identifier.result}"
  location = var.azure_location

  tags = {
    environment = "${var.environment}"
    terraform   = true
  }
}

