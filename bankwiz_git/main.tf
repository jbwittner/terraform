# Define the variable for GitHub token
variable "github_token" {}
variable "sonar_token" {}
variable "kube_config" {}

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
  gitignore_template = "Java"
  auto_init = true
  visibility = "public"
}

resource "github_branch" "develop" {
  repository = github_repository.repo.name
  branch     = "develop"
  source_branch = "main"
}

resource "github_branch_default" "branch_default" {
  repository = github_repository.repo.name
  branch     = "develop"
}

resource "github_actions_secret" "sonar_token" {
  repository       = github_repository.repo.name
  secret_name      = "SONAR_TOKEN"
  plaintext_value  = var.sonar_token
}

resource "github_dependabot_secret" "sonar_token" {
  repository       = github_repository.repo.name
  secret_name      = "SONAR_TOKEN"
  plaintext_value  = var.sonar_token
}

resource "github_actions_secret" "kube_config" {
  repository       = github_repository.repo.name
  secret_name      = "KUBE_CONFIG"
  plaintext_value  = var.kube_config
}