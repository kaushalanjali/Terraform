provider "aws" {
  region = "us-east-2"
  shared_credentials_file = "~/.aws/credentials"
  profile = "default"
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}


module "redis" {
  source = "../../../modules/EC"

  name_prefix           = "uat-cluster"
  number_cache_clusters = 2
  node_type             = "cache.t3.micro"

  cluster_mode_enabled    = true
  replicas_per_node_group = 1
  num_node_groups         = 1

  engine_version           = "6.x"
  port                     = 6379
  maintenance_window       = "mon:03:00-mon:04:00"
  snapshot_window          = "04:00-06:00"
  snapshot_retention_limit = 7

  automatic_failover_enabled = true

  at_rest_encryption_enabled = true
  transit_encryption_enabled = true
  auth_token                 = ""

  apply_immediately = true
  family            = "redis6.x"
  description       = "uat elasticache redis"

  subnet_ids = ["subnet-0bcb67dc935f0a5be", "subnet-0303b6a910230ed72", "subnet-0819794937da0cb20"]
  vpc_id     = "vpc-0544ccedc94dc7902"

  ingress_cidr_blocks = ["0.0.0.0/0"]

  parameter = [
    {
      name  = "repl-backlog-size"
      value = "16384"
    }
  ]

  tags = {
    Terraform   = "true"
    Environment = "UAT"
  }  
}