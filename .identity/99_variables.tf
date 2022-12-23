variable "github" {
  type = object({
    org        = string
    repository = string
  })
  description = "GitHub Organization and repository name"
}

variable "env" {
  type        = string
  description = "Environment"
}

variable "pullrequest_terraform_subscription_role" {
  type        = string
  description = "Pull request identity role on subscription"
}