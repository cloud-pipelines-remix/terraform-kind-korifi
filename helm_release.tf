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

resource "helm_release" "concourse" {
  depends_on       = [module.vault_operator_init]
  name             = "concourse"
  repository       = "https://concourse-charts.storage.googleapis.com/"
  chart            = "concourse"
  namespace        = "concourse"
  create_namespace = true

  set {
    name  = "concourse.web.auth.github.enabled"
    value = true
  }
  set {
    name  = "concourse.web.auth.mainTeam.github.user"
    value = var.concourse_github_user
  }
  set {
    name  = "concourse.web.clusterName"
    value = var.concourse_clustername
  }
  set {
    name  = "concourse.web.enableRedactSecrets"
    value = false
  }
  set {
    name  = "concourse.web.externalUrl"
    value = var.concourse_external_url
  }
  set {
    name  = "concourse.web.jobSchedulingMaxInFlight"
    value = 1
  }
  set {
    name  = "concourse.web.localAuth.enabled"
    value = false
  }
  set {
    name  = "concourse.web.kubernetes.enabled"
    value = false
  }
  set {
    name  = "concourse.web.vault.enabled"
    value = true
  }
  set {
    name  = "concourse.web.vault.url"
    value = var.vault_address
  }
  set {
    name  = "concourse.web.vault.authBackend"
    value = "token"
  }
  set {
    name  = "concourse.worker.runtime"
    value = "houdini"
  }
  set {
    name  = "secrets.githubClientId"
    value = var.concourse_github_client_id
  }
  set {
    name  = "secrets.githubClientSecret"
    value = var.concourse_github_client_secret
  }
  set {
    name  = "secrets.vaultClientToken"
    value = module.vault_operator_init.stdout
  }
}