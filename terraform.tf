terraform {
  required_providers {
    # main generic meta-arguments
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 3.27"
    }
  }

  required_version = ">= 1.1.0"
}

# provider configuration
provider "aws" {
  region  = var.region
  shared_config_files       = ["$HOME/.aws/conf"]
  shared_credentials_files  = ["$HOME/.aws/credentials"]
  profile                   = "customprofile"
}