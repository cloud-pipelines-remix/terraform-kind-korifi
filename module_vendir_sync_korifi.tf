module "vendir_sync_korifi" {

  source = "Invicton-Labs/shell-resource/external"

  // The command to run on resource creation on Unix machines
  command_unix = "vendir sync"

  // The command to run on resource destruction on Unix machines
  command_destroy_unix = "rm -rf vendir"

  // The directory to run the command in
  working_dir = path.root

  // Environment variables that, when changed, will not trigger a re-create
  environment_triggerless = {
    ORIGINAL_CREATED_TIME = timestamp()
  }
}