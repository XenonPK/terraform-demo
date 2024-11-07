resource "random_string" "terraform-state-identifier" {
  length  = 4
  special = false
  numeric = false
  lower = true
  upper = false
}

resource "azurerm_resource_group" "terraform-state-rg" {
  name     = "terraform-state-${random_string.terraform-state-identifier.result}"
  location = var.azure_location

  tags = {
    environment = "${var.environment}"
    terraform = true
  }
}


locals {
  storage_account_name = substr(lower("${var.environment}${random_string.terraform-state-identifier.result}tfstate"),0,23)

}

resource "azurerm_storage_account" "terraform-state-sa" {
  # The lower() function ensures we are compliant with the storage account restrictions
  # The substr function ensures we are compliant with the maximum size of the storage account name
  name                     = local.storage_account_name
  resource_group_name      = azurerm_resource_group.terraform-state-rg.name
  location                 = azurerm_resource_group.terraform-state-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "${var.environment}"
    terraform = true
  }

  lifecycle {
    # This allows us to ignore changes
    #ignore_changes = [tags]
    precondition {
      condition = length(local.storage_account_name) < 23
      error_message = "The storage account name is too long (${length(local.storage_account_name)}), it will cause issues with the subscription_name"
    }
  }
}

resource "azurerm_storage_container" "terraform-state-container" {
  name                  = "${var.environment}-${random_string.terraform-state-identifier.result}"
  storage_account_name  = azurerm_storage_account.terraform-state-sa.name
  container_access_type = "private"
}
