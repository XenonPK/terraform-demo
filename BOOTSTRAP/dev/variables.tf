variable "environment" {
  type        = string
  description = "This variable sets the environment for all resources"
  default     = "dev"

  validation {
    condition = length(var.environment) < 5
    error_message = "The environment variable is too long, it will cause issues with the subscription_name"
  }

}

variable "azure_location" {
  type = string
  description = "The azure location where the resources will be created."
  default = "France Central"
}

variable "azure_subscription_id" {
  type        = string
  description = "This is the id of the Azure subscription where we want to create the resources"
}
