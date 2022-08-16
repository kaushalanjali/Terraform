provider "aws" {
  region = local.region
  shared_credentials_files = ["~/.aws/credentials"]
  profile = "mfa"
}

locals {
  name   = "ex-tgw-${replace(basename(path.cwd), "_", "-")}"
  region = "us-east-2"
  private_subnets_uat     = ["subnet-0cebba74430f291c8", "subnet-095b82ea0496ae4e7", "subnet-05ce7bc7fa388262c"]
  private_subnets_mgmt    = ["subnet-0528062e314dea35a", "subnet-03f4f87ebf281a5f9", "subnet-0a734cfac469c4b0c"]

  tags = {
    Environment = "Mgmt-VPC"
    Terraform        = "true"
  }
}
################################################################################
# Data block to fetch the VPC details
################################################################################

#data "aws_vpc" "uat-vpc" {
#   name   = "uat-vpc"
#}
#
#data "aws_vpc" "mgmt-vpc" {
#   name   = "mgmt-vpc"
#}
#
#data "aws_subnet" "selected" {
#  id = var.subnet_id
#}

################################################################################
# Transit Gateway Module
################################################################################

module "tgw" {
  source = "../../../modules/Transit-Gateway"

  name            = local.name
  description     = "My TGW shared with several AWS VPCs"
  amazon_side_asn = 64532
  enable_default_route_table_association = false
  enable_default_route_table_propagation = false
  transit_gateway_cidr_blocks = ["10.99.0.0/24"]

  # When "true" there is no need for RAM resources if using multiple AWS accounts
  enable_auto_accept_shared_attachments = true

  # When "true", allows service discovery through IGMP
  enable_mutlicast_support = false

  vpc_attachments = {
    vpc1 = {
      vpc_id       = "vpc-012502da473f055f0" # must be fetched from data block
      subnet_ids   = local.private_subnets_uat # need to fetch values dynamically
      dns_support  = true
      ipv6_support = false
      transit_gateway_default_route_table_association = false
      transit_gateway_default_route_table_propagation = false

      tgw_routes = [
        {
          destination_cidr_block = "30.0.0.0/16"
        },
        {
          blackhole              = true
          destination_cidr_block = "20.10.0.0/16"
        }
      ]
    },
    vpc2 = {
      vpc_id     = "vpc-08e4d7848847b9bf9"
      transit_gateway_default_route_table_association = false
      transit_gateway_default_route_table_propagation = false

      subnet_ids = local.private_subnets_mgmt # need to fetch values dynamically
      tgw_routes = [
        {
          destination_cidr_block = "0.0.0.0/24"
        },
        {
          blackhole              = true
          destination_cidr_block = "10.10.10.10/32"
        }
      ]
    },
  }

  ram_allow_external_principals = false
  #ram_principals                = [307990089504]

  tags = local.tags
}