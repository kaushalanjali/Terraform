provider "aws" {
  region = "us-east-2"
  shared_credentials_file = "~/.aws/credentials"
  profile = "default"
}


locals {
}

##################################################################
# Data sources to get VPC and subnets
##################################################################
data "aws_vpc" "default" {
  filter {
    name   = "tag:Name"
    values = ["uat-vpc"]
  }
}

data "aws_instance" "Main-Saitama-1_RND" {
  filter {
    name   = "tag:Name"
    values = ["Main-Saitama-1_RND"]
  }
}

data "aws_subnets" "all" {
  filter {
    name   = "tag:Name"
    values = ["uat-vpc-public*"]
  }
}
data "aws_security_group" "ALB-security-group" {
  filter {
    name   = "tag:Name"
    values = ["ALB-security-group*"]
  }
}

resource "random_pet" "this" {
  length = 2
}

module "log_bucket" {
 source  = "terraform-aws-modules/s3-bucket/aws"
 version = "~> 3.0"

  bucket                         = "backend-alb-log"
  acl                            = "log-delivery-write"
  force_destroy                  = true
  attach_elb_log_delivery_policy = true
}



##################################################################
# Application Load Balancer
##################################################################
module "alb" {
  source = "../../../modules/ELB"

  name = "backend-alb"

  load_balancer_type = "application"

  vpc_id          = data.aws_vpc.default.id
  security_groups = [data.aws_security_group.ALB-security-group.id]
  subnets         = data.aws_subnets.all.ids

     # See notes in README (ref: https://github.com/terraform-providers/terraform-provider-aws/issues/7987)
     access_logs = {
       bucket = "backend-alb-logs-correct-beetle"
     }

  target_groups = [
    {
      name_prefix      = "BE"
      backend_protocol = "HTTPS"
      backend_port     = 443
      target_type      = "ip"
      targets = {
        my_target = {
          target_id = data.aws_instance.Main-Saitama-1_RND.private_ip #EC2 module must run before this
          port = 443
          availability_zone = "us-east-2a"
          instance_state_names = ["running"]
        }
      }
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = "arn:aws:acm:us-east-2:001504584364:certificate/dc2d7f1c-eb97-4bd2-8b15-3f404d6ba5a5"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "UAT"
    Terraform = true
    Name = "Main-Saitama-1_RND"
  }
}