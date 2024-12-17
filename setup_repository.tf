# Simple Terraform configuration file

# Define the variable for GitHub token
variable "github_token" {}

# Specify the provider
provider "github" {
  token = var.github_token # Token sourced from an environment variable
}

# This resource allows you to create and manage repositories within your GitHub organization or personal account.
resource "github_repository" "repo" {
  name = "bankwiz_server"
  allow_auto_merge = true
  allow_merge_commit = true
  allow_rebase_merge = true
  allow_squash_merge = true
  allow_update_branch = false
  delete_branch_on_merge = true
}

resource "github_actions_secret" "test_secret" {
  repository       = github_repository.repo.name
  secret_name      = "test_secret_name"
  plaintext_value  = "%s"
}
