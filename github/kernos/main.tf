# Define the required variables
variable "github_token" {}
variable "sonar_token" {}

# Specify the provider
provider "github" {
  token = var.github_token # Token sourced from an environment variable
}

# This resource allows you to create and manage repositories within your GitHub organization or personal account.
resource "github_repository" "repo" {
  name                   = "kernos"
  allow_auto_merge       = true
  allow_merge_commit     = true
  allow_rebase_merge     = true
  allow_squash_merge     = true
  allow_update_branch    = false
  delete_branch_on_merge = true
  vulnerability_alerts   = true
  gitignore_template     = "Java"
  auto_init              = true
  visibility             = "public"
}

# This resource allows you to create and manage branches within your GitHub repository.
resource "github_branch" "develop" {
  repository    = github_repository.repo.name
  branch        = "develop"
  source_branch = "main"
}

# This resource allows you to set the default branch for your GitHub repository.
resource "github_branch_default" "branch_default" {
  repository = github_repository.repo.name
  branch     = "develop"
}

# This resource allows you to enable Dependabot security updates for your GitHub repository.
resource "github_repository_dependabot_security_updates" "default" {
  repository = github_repository.repo.name
  enabled    = true
}

## GITHUB ACTIONS SECRETS
# This resource allows you to create and manage secrets within your GitHub repository.
resource "github_actions_secret" "sonar_token" {
  repository      = github_repository.repo.name
  secret_name     = "SONAR_TOKEN"
  plaintext_value = var.sonar_token
}
## GITHUB ACTIONS SECRETS

## GITHUB DEPENDABOT SECRETS
# This resource allows you to create and manage secrets within your GitHub repository.
resource "github_dependabot_secret" "sonar_token" {
  repository      = github_repository.repo.name
  secret_name     = "SONAR_TOKEN"
  plaintext_value = var.sonar_token
}
## GITHUB DEPENDABOT SECRETS

# This resource allows you to create and manage secrets within your GitHub repository.
resource "github_repository_ruleset" "develop" {
  name        = "develop"
  repository  = github_repository.repo.name
  target      = "branch"
  enforcement = "active"

  # Define the conditions for the ruleset
  conditions {
    ref_name {
      include = ["~DEFAULT_BRANCH"]
      exclude = []
    }
  }

  # Define the rules for the ruleset
  rules {
    creation                = true
    update                  = false
    deletion                = true
    required_linear_history = true
    required_signatures     = false
    non_fast_forward        = true

    pull_request {
      required_approving_review_count   = 0
      dismiss_stale_reviews_on_push     = true
      require_code_owner_review         = false
      require_last_push_approval        = false
      required_review_thread_resolution = false
    }

  }
}
