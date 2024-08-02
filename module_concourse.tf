module "concourse" {
  depends_on                     = [module.vault_operator_init]
  source                         = "./modules/concourse"
  concourse_github_client_id     = var.concourse_github_client_id
  concourse_github_client_secret = var.concourse_github_client_secret
  vault_address                  = var.vault_address
  vault_client_token             = module.vault_operator_init.stdout
}