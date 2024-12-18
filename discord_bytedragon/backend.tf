terraform {
  backend "gcs" {
    bucket = "f1ca7121a411ff04-terraform-remote-backend"
    prefix  = "terraform/state/discord_bytedragon"
  }
}

terraform {
  required_providers {
    discord = {
      source = "Lucky3028/discord"
      version = "1.9.0"
    }
  }
}