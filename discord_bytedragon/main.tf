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
    name = "Toto category"
    position = 0
    server_id = resource.discord_server.bytedragon.id
}

resource "discord_text_channel" "toto_aaa_channel" {
    depends_on = [
      resource.discord_category_channel.toto_category
    ]
    name = "toto aaa"
    position = 0
    server_id = resource.discord_server.bytedragon.id
    category = resource.discord_category_channel.toto_category.id
}

resource "discord_text_channel" "toto_bbb_channel" {
    depends_on = [
      resource.discord_category_channel.toto_category
    ]
    name = "toto bbb"
    position = 1
    server_id = resource.discord_server.bytedragon.id
    category = resource.discord_category_channel.toto_category.id
}
