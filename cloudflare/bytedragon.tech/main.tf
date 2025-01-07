# Define the required variables (secrets)
variable "cloudflare_api_token" {}

# Define the required variables

# Specify the provider
provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

resource "cloudflare_account" "account" {
  name              = "Jeanbaptiste.wittner@outlook.com's Account"
  type              = "standard"
}

resource "cloudflare_zone" "zone" {
  account_id = cloudflare_account.account.id
  zone       = "bytedragon.tech"
}

resource "cloudflare_certificate_pack" "bankwiz_dev_api" {
  zone_id               = cloudflare_zone.zone.id
  type                  = "advanced"
  hosts                 = ["app.dev.bankwiz.bytedragon.tech"]
  validation_method     = "txt"
  validity_days         = 30
  certificate_authority = "google"
  cloudflare_branding   = false
}

resource "cloudflare_certificate_pack" "sshguardian_dev_api" {
  zone_id               = cloudflare_zone.zone.id
  type                  = "advanced"
  hosts                 = ["api.dev.sshguardian.bytedragon.tech"]
  validation_method     = "txt"
  validity_days         = 30
  certificate_authority = "google"
  cloudflare_branding   = false
}