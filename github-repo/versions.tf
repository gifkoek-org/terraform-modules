terraform {
  backend "local" {}
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.2.1"
    }
    aws = {
      source = "hashicorp/aws"
    }
  }
  required_version = ">= 0.13"
}
