prefix    = "gitpoc"
env_short = "d"
env       = "dev"

environment_ci_roles = {
  subscription     = "Contributor"
  tfstate_inf      = "Contributor"
  github_runner_rg = "Contributor"
}

github_repository_environment_ci = {
  protected_branches     = false
  custom_branch_policies = true
}

environment_cd_roles = {
  subscription     = "Contributor"
  tfstate_inf      = "Contributor"
  github_runner_rg = "Contributor"
}

github_repository_environment_cd = {
  protected_branches     = false
  custom_branch_policies = true
}
