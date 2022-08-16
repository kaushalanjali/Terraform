terraform {
  backend "s3" {
    bucket         = "gordy-infra-statefiles"
    key            = "tgw.tfstate"
    region         = "us-east-2"
    dynamodb_table = "uat-terraform-lock"
    profile	   = "mfa"
  }
}
