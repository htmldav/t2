terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.74.0"
    }
  }
}

provider "aws" {
  region = var.region
  # aws cli user credentials
  # user should have the administration policy or policy as per the lpp principle
    #   access_key = var.cli_usr_access_key
    #   secret_key = var.cli_usr_secret_key
}
