resource "random_string" "terraform-state-identifier" {
  length  = 4
  special = false
  numeric = false
}

resource "azurerm_resource_group" "terraform-state-rg" {
  name     = "terraform-state-${random_string.terraform-state-identifier.result}"
  location = "West Europe"

  tags = {
    environment = "dev"
  }
}

resource "azurerm_storage_account" "terraform-state-sa" {
  name                     = "dev-${random_string.terraform-state-identifier.result}-tfstate"
  resource_group_name      = azurerm_resource_group.terraform-state-rg.name
  location                 = azurerm_resource_group.terraform-state-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "dev"
  }
}

resource "azurerm_storage_container" "terraform-state-container" {
  name                  = "dev-${random_string.terraform-state-identifier.result}"
  storage_account_name  = azurerm_storage_account.terraform-state-sa.name
  container_access_type = "private"
}
