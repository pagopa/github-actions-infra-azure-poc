resource "azurerm_role_assignment" "pullrequest_terraform_subscription" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = var.pullrequest_terraform_subscription_role
  principal_id         = azuread_service_principal.pullrequest.object_id
}

# resource "azurerm_role_assignment" "pullrequest_terraform_storage_account_tfstate_inf" {
#   scope                = data.azurerm_storage_account.tfstate_inf.id
#   role_definition_name = "Reader"
#   principal_id         = azuread_service_principal.pullrequest.object_id
# }
