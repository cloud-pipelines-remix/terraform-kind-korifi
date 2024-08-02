data "cloudflare_user" "me" {}
data "cloudflare_api_token_permission_groups" "all" {}

resource "cloudflare_api_token" "example" {
  name = "Terraform Cloud (Terraform)"
  policy {
    permission_groups = [
      data.cloudflare_api_token_permission_groups.all.account["Argo Tunnel Write"],
    ]
    resources = {
      "com.cloudflare.api.account.*" = "*",
    }
  }
}