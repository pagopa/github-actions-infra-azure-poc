resource "azuread_application" "pullrequest" {
  display_name = "${local.app_name}-pullrequest"
}

resource "azuread_service_principal" "pullrequest" {
  application_id = azuread_application.pullrequest.application_id
}

resource "azuread_application_federated_identity_credential" "pullrequest" {
  application_object_id = azuread_application.pullrequest.object_id
  display_name          = "github-federated"
  description           = "github-federated"
  audiences             = ["api://AzureADTokenExchange"]
  issuer                = "https://token.actions.githubusercontent.com"
  subject               = "repo:${var.github.org}/${var.github.repository}:pull_request"
}

output "azure_pullrequest" {
  value = {
    app_name       = "${local.app_name}-pullrequest"
    client_id      = azuread_service_principal.pullrequest.application_id
    application_id = azuread_service_principal.pullrequest.application_id
    object_id      = azuread_service_principal.pullrequest.object_id
  }
}
