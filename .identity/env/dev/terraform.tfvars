prefix    = "gitpoc"
env_short = "d"
env       = "dev"

github = {
  org        = "pagopa"
  repository = "github-self-hosted-runner-azure-poc"
}

pullrequest_terraform_subscription_role = "Contributor"

tags = {
  CreatedBy   = "Terraform"
  Environment = "DEV"
  Owner       = "cloud"
  Source      = "https://github.com/pagopa/github-self-hosted-runner-azure-poc"
  CostCenter  = "TS310 - PAGAMENTI & SERVIZI"
}
