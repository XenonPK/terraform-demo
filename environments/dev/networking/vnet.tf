module "avm-res-network-virtualnetwork" {
  source  = "Azure/avm-res-network-virtualnetwork/azurerm"
  version = "0.6.0"
  # insert the 3 required variables here

  name                = "${var.environment}-vnet-${random_string.networking-identifier.result}"
  location            = azurerm_resource_group.networking-rg.location
  resource_group_name = azurerm_resource_group.networking-rg.name
  address_space       = var.vnet_address_space

  enable_telemetry = false

  encryption = {
    enabled = true

    # We allow unencrypted traffic for now because this azure feature is still experimental
    # Later on, we want to change this to DropUnencrypted
    enforcement = "AllowUnencrypted"
  }

  subnets = {
    private = {
      name           = "${var.environment}-private-${random_string.networking-identifier.result}"
      address_prefix = cidrsubnet(var.vnet_address_space[0], 2, 0)
    }
    database = {
      name           = "${var.environment}-database-${random_string.networking-identifier.result}"
      address_prefix = cidrsubnet(var.vnet_address_space[0], 2, 1)
    }
  }

  tags = {
    environment = var.environment
    terraform   = true
  }
}
