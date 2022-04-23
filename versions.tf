terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.5.1"
    }

    null = {
      source  = "hashicorp/null"
      version = "~>3.0.0"
    }
  }
  required_version = "~> 1.0"
}