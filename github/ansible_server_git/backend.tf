terraform {
  backend "gcs" {
    bucket = "f1ca7121a411ff04-terraform-backend"
    prefix = "terraform/state/github/ansible_server_git"
  }
}

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}