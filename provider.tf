terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
    helm = {
      source = "hashicorp/helm"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    random = {
      source = "hashicorp/random"
    }
    vault = {
      source = "hashicorp/vault"
    }
  }
}

# Using CLOUDFLARE_API_TOKEN from env
# provider "cloudflare" {
#   api_token = var.cloudflare_api_token
# }

provider "helm" {
  kubernetes {
    config_path = var.kubernetes_config_path
  }
}

provider "kubernetes" {
  config_path    = var.kubernetes_config_path
  config_context = var.kubernetes_config_context
}

provider "vault" {
  address          = var.vault_address
  token            = module.vault_operator_init.stdout
  skip_child_token = true
}