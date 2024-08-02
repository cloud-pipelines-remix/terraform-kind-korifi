data "cloudflare_accounts" "example" {}

resource "cloudflare_tunnel" "example" {
  account_id = data.cloudflare_accounts.example.accounts[0].id
  name       = "korifi-cloudflare"
  secret     = random_string.tunnel_secret.result
}