output "tfstate_backend_configuration_prd" {
  description = "The name of the resource group that contains the tfstate storage account that corresponds to the prod environment."

  value = <<EOT
NOTE: The prd environment has been bootstrapped.
Add the following backend configuration to the init.tf file:
############################################################

terraform {
  backend "azurerm" {
    subscription_id = "${var.azure_subscription_id}"
    resource_group_name  = "${azurerm_resource_group.terraform-state-rg.name}"
    storage_account_name = "${azurerm_storage_account.terraform-state-sa.name}"
    container_name = "${azurerm_storage_container.terraform-state-container.name}"
    key = "SPECIFY_STATE_FILE_NAME_HERE"
  }
}

############################################################
Make sure replace the string "SPECIFY_STATE_FILE_NAME_HERE" before performing terraform init!
EOT
}

