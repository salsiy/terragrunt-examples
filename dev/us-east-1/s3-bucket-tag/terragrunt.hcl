include "root" {
  path = find_in_parent_folders("root.hcl")
}

terraform {
  source = "../../../modules/s3-bucket-object-tag"
}

locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

inputs = {
  environment    = local.env_vars.locals.environment
  bucket_name    = "my-app-${local.env_vars.locals.environment}-bucket"
  
  object_key     = "config/app-config.json"
  object_content = jsonencode({
    env     = local.env_vars.locals.environment
    debug   = true
    version = "1.0.0"
  })
}