prefix    = "gitpoc"
env_short = "p"
env       = "prod"

environment_ci_roles = {
  subscription     = [
    "Reader",
    "Storage Blob Data Reader",
    "Storage File Data SMB Share Reader",
    "Storage Queue Data Reader",
    "Storage Table Data Reader",
  ]
  # tfstate_inf      = "Reader"
  github_runner_rg = "Contributor"
}

github_repository_environment_ci = {
  protected_branches     = false
  custom_branch_policies = true
}

environment_cd_roles = {
  subscription     = [
    "Contributor",
    "Storage Account Contributor",
  ]
  # tfstate_inf      = "Contributor"
  github_runner_rg = "Contributor"
}

github_repository_environment_cd = {
  protected_branches     = true
  custom_branch_policies = false
}
