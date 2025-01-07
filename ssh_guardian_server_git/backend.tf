terraform {
  backend "gcs" {
    bucket = "f1ca7121a411ff04-terraform-remote-backend"
    prefix = "terraform/state/ssh_guardian_server_git"
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