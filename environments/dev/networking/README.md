## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.9.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.6.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.9.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_avm-res-network-virtualnetwork"></a> [avm-res-network-virtualnetwork](#module\_avm-res-network-virtualnetwork) | Azure/avm-res-network-virtualnetwork/azurerm | 0.6.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.networking-rg](https://registry.terraform.io/providers/hashicorp/azurerm/4.9.0/docs/resources/resource_group) | resource |
| [random_string.networking-identifier](https://registry.terraform.io/providers/hashicorp/random/3.6.3/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_location"></a> [azure\_location](#input\_azure\_location) | The azure location where the resources will be created. | `string` | `"France Central"` | no |
| <a name="input_azure_subscription_id"></a> [azure\_subscription\_id](#input\_azure\_subscription\_id) | This is the id of the Azure subscription where we want to create the resources | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | This variable sets the environment for all resources | `string` | `"dev"` | no |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | The address space to use for the vnet | `list(string)` | <pre>[<br>  "172.16.20.0/22"<br>]</pre> | no |

## Outputs

No outputs.
