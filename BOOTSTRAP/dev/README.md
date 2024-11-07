# BOOTSTRAP folder for our DEV environment

This folder contains the necessary code to create a storage account, that will be used to hold the terraform state files.
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.8.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.6.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.8.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.terraform-state-rg](https://registry.terraform.io/providers/hashicorp/azurerm/4.8.0/docs/resources/resource_group) | resource |
| [azurerm_storage_account.terraform-state-sa](https://registry.terraform.io/providers/hashicorp/azurerm/4.8.0/docs/resources/storage_account) | resource |
| [azurerm_storage_container.terraform-state-container](https://registry.terraform.io/providers/hashicorp/azurerm/4.8.0/docs/resources/storage_container) | resource |
| [random_string.terraform-state-identifier](https://registry.terraform.io/providers/hashicorp/random/3.6.3/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | This variable sets the environment for all resources | `string` | `"dev"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tfstate_backend_configuration_prd"></a> [tfstate\_backend\_configuration\_prd](#output\_tfstate\_backend\_configuration\_prd) | The name of the resource group that contains the tfstate storage account that corresponds to the prod environment. |




# Example content of terraform.tfvars:
azure_subscription_id = "subscription_id"
