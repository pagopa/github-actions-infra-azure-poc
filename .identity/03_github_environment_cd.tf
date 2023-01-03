resource "github_repository_environment" "github_repository_environment_cd" {
  environment = "${var.env}-cd"
  repository  = var.github.repository
  deployment_branch_policy {
    protected_branches     = var.github_repository_environment_cd.protected_branches
    custom_branch_policies = var.github_repository_environment_cd.custom_branch_policies
  }
}

resource "github_actions_environment_secret" "azure_cd_tenant_id" {
  repository      = var.github.repository
  environment     = "${var.env}-cd"
  secret_name     = "AZURE_TENANT_ID"
  plaintext_value = data.azurerm_client_config.current.tenant_id
}

resource "github_actions_environment_secret" "azure_cd_subscription_id" {
  repository      = var.github.repository
  environment     = "${var.env}-cd"
  secret_name     = "AZURE_SUBSCRIPTION_ID"
  plaintext_value = data.azurerm_subscription.current.subscription_id
}

resource "github_actions_environment_secret" "azure_cd_client_id" {
  repository      = var.github.repository
  environment     = "${var.env}-cd"
  secret_name     = "AZURE_CLIENT_ID"
  plaintext_value = azuread_service_principal.environment_cd.application_id
}
