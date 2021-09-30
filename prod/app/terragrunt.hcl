include {
  path = find_in_parent_folders()
}

terraform {
  source = "github.com/fanovilla/demo-infrastructure-modules.git//app?ref=v0.0.1"
}

inputs = {
  env = "prod"
}