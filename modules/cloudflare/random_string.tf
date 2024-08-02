resource "random_string" "tunnel_secret" {
  length = 64
  special = false
}
