# general

variable "prefix" {
  type = string
  validation {
    condition = (
      length(var.prefix) <= 6
    )
    error_message = "Max length is 6 chars."
  }
}

variable "env" {
  type = string
  validation {
    condition = (
      length(var.env) <= 4
    )
    error_message = "Max length is 4 chars."
  }
}

variable "env_short" {
  type = string
  validation {
    condition = (
      length(var.env_short) <= 1
    )
    error_message = "Max length is 1 chars."
  }
}

variable "location" {
  type    = string
  default = "westeurope"
}

variable "location_short" {
  type        = string
  description = "Location short like eg: neu, weu.."
}

variable "tags" {
  type = map(any)
  default = {
    CreatedBy = "Terraform"
  }
}

### Network
variable "vnet_address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "github_runner" {
  type = object({
    subnet_address_prefixes = list(string)
  })
  description = "GitHub runner variables"
  default = {
    subnet_address_prefixes = ["10.0.0.0/23"]
  }
}

variable "private_endpoints_subnet_address_prefixes" {
  type    = list(string)
  default = ["10.0.4.0/23"]
}

### Monitor

variable "log_analytics_workspace" {
  type = object({
    sku               = string
    retention_in_days = number
    daily_quota_gb    = number
  })
  description = "GitHub runner variables"
  default = {
    sku               = "PerGB2018"
    retention_in_days = 30
    daily_quota_gb    = 1
  }
}
