terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.34.0"
    }
  }
}

provider "aws" {
  # alias      = "domains"
  region     = "eu-west-2"
  access_key = var.provider-aws-domains-access_key_id
  secret_key = var.provider-aws-domains-secret_access_key
  assume_role {
    role_arn     = var.provider-aws-domains-role_arn
    session_name = "Terraform-Cloud"
    external_id  = "j4kfmjdlw940fjs"
  }
}
