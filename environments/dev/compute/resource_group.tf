resource "random_string" "compute-identifier" {
  length  = 4
  special = false
  numeric = false
  lower   = true
  upper   = false
}

resource "azurerm_resource_group" "compute-rg" {
  name     = "${var.environment}-compute-${random_string.compute-identifier.result}"
  location = var.azure_location

  tags = {
    environment = "${var.environment}"
    terraform   = true
  }
}

