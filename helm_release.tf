resource "helm_release" "vault" {
  depends_on       = [module.deploy_kind_korifi]
  name             = "vault"
  repository       = "https://helm.releases.hashicorp.com"
  chart            = "vault"
  namespace        = "vault"
  create_namespace = true
  set {
    name  = "ui.enabled"
    value = true
  }
}