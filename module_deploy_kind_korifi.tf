module "deploy_kind_korifi" {

  depends_on = [module.vendir_sync_korifi]

  source = "Invicton-Labs/shell-resource/external"

  // The command to run on resource creation on Unix machines
  command_unix = "${path.module}/vendir/korifi/scripts/deploy-on-kind.sh korifi"

  // The command to run on resource destruction on Unix machines
  command_destroy_unix = "kind delete cluster -n korifi"

  // The directory to run the command in
  working_dir = path.module

  // Environment variables that, when changed, will not trigger a re-create
  environment_triggerless = {
    ORIGINAL_CREATED_TIME = timestamp()
  }
}