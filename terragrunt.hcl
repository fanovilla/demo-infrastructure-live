# https://terragrunt.gruntwork.io/docs/getting-started/quick-start/#keep-your-backend-configuration-dry
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "demo-my-terraform-state"

    key = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    #encrypt        = true
    #dynamodb_table = "my-lock-table"
  }
}

generate "providers" {
  path      = "providers.tf"
  if_exists = "overwrite"
  contents  = <<EOF
    terraform {
      required_providers {
        aws = {
          source  = "hashicorp/aws"
          version = "~> 3.0"
        }
      }
    }
    provider "aws" {
      region = "us-east-1"
    }
EOF
}