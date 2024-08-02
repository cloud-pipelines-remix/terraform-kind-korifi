variable "concourse_github_user" {
  type    = string
  default = "dashaun"
}

variable "concourse_clustername" {
  type    = string
  default = "Spring Cloud Pipelines Remix"
}

variable "concourse_external_url" {
  type    = string
  default = "https://concourse.dashaun.live"
}

variable "concourse_github_client_id" {
  type = string
}

variable "concourse_github_client_secret" {
  type = string
}

variable "vault_client_token" {
  type = string
}

variable "vault_address" {
  type = string
}