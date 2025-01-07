# Define the required variables (secrets)
variable "sonar_token" {}

# Define the required variables

# Specify the provider
provider "sonarcloud" {
  organization = jbwittner
  token        = var.sonar_token
}