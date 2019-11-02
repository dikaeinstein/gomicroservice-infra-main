provider "aws" {
  version = "~> 2.32"
  region  = "eu-west-2"
}

provider "archive" {
  version = "~> 1.3"
}

terraform {
  backend "s3" {
    bucket = "dikaeinstein-gomicroservice-terraform-state"
    key    = "gomicroservice-infra.tfstate"
    region = "eu-west-2"

    dynamodb_table = "gomicroservice-infra-terraform-state-lock"
    encrypt        = true
  }
}
