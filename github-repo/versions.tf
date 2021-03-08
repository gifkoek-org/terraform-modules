terraform {
  required_providers {
    github = {
      source  = "hashicorp/github"
      version = "~> 4.4"
    }
    aws = {
      source = "hashicorp/aws"
    }
  }
  required_version = ">= 0.13"
}
