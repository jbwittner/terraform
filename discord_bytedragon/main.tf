# Define the required variables
variable "discord_token" {}

# Specify the provider
provider "discord" {
  token = var.discord_token # Token sourced from an environment variable
}

resource "discord_server" "bytedragon" {
  name = "ByteDragon server"
}

resource "discord_category_channel" "toto_category" {
  depends_on = [
    resource.discord_server.bytedragon
  ]
  name      = "Toto category"
  position  = 0
  server_id = resource.discord_server.bytedragon.id
}

resource "discord_text_channel" "toto_aaa_channel" {
  depends_on = [
    resource.discord_category_channel.toto_category
  ]
  name                     = "toto-aaa"
  position                 = 0
  server_id                = resource.discord_server.bytedragon.id
  category                 = resource.discord_category_channel.toto_category.id
  sync_perms_with_category = true
}

resource "discord_text_channel" "toto_bbb_channel" {
  depends_on = [
    resource.discord_category_channel.toto_category
  ]
  name                     = "toto-bbb"
  position                 = 1
  server_id                = resource.discord_server.bytedragon.id
  category                 = resource.discord_category_channel.toto_category.id
  sync_perms_with_category = true
}

resource "discord_voice_channel" "toto-aaa-voice" {
  name                     = "toto-aaa-voice"
  server_id                = resource.discord_server.bytedragon.id
  category                 = resource.discord_category_channel.toto_category.id
  sync_perms_with_category = true
  position                 = 1
  user_limit               = 5
}

resource "discord_message" "hello_world" {
  depends_on = [
    resource.discord_text_channel.toto_aaa_channel
  ]
  channel_id = discord_text_channel.toto_aaa_channel.id
  content    = "hello world"
}
