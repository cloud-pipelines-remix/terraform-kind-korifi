# Terraform KIND with Korifi

A simple Terraform module to setup a [KIND](https://kind.sigs.k8s.io/) cluster with [Korifi](https://github.com/cloudfoundry/korifi)

## Requirements

- Vendir
- KIND


## Module reference
Add this module to your terraform template:

```
module "memtier" {
  source = "github.com/cloud-pipelines-remix/terraform-kind-korifi"
}
```

## Execution
Initialize terraform:
```
terraform init
```

Apply
```
terraform apply
```
