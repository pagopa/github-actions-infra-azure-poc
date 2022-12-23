prefix    = "gitpoc"
env_short = "p"
env       = "prod"

github = {
  org        = "pagopa"
  repository = "github-self-hosted-runner-azure-poc"
}

pullrequest_terraform_subscription_role = "Reader"

tags = {
  CreatedBy   = "Terraform"
  Environment = "PROD"
  Owner       = "cloud"
  Source      = "https://github.com/pagopa/github-self-hosted-runner-azure-poc"
  CostCenter  = "TS310 - PAGAMENTI & SERVIZI"
}
