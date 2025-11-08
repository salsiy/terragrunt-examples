include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules/s3-bucket-object-tag"
}

locals {
  env_vars   = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  app_config = yamldecode(file(find_in_parent_folders("app-config.yaml")))
}

inputs = {
  environment = local.env_vars.locals.environment
  bucket_name = "my-app-${local.env_vars.locals.environment}-bucket"

  object_key = local.app_config.app.object_key
  object_content = jsonencode({
    env      = local.env_vars.locals.environment
    app_name = local.app_config.app.name
    debug    = local.app_config.app.debug
    version  = local.app_config.app.version
  })
}