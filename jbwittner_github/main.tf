# Define the required variables
variable "github_token" {}

# Specify the provider
provider "github" {
  token = var.github_token # Token sourced from an environment variable
}