output "elasticache_replication_group_arn" {
  value       = aws_elasticache_replication_group.this.arn
  description = "The Amazon Resource Name (ARN) of the created ElastiCache Replication Group."
}

output "elasticache_replication_group_id" {
  value       = aws_elasticache_replication_group.this.id
  description = "The ID of the ElastiCache Replication Group."
}

output "elasticache_replication_group_primary_endpoint_address" {
  value       = var.cluster_mode_enabled ? aws_elasticache_replication_group.this.configuration_endpoint_address : aws_elasticache_replication_group.this.primary_endpoint_address
  description = "The address of the endpoint for the primary node in the replication group."
}

output "elasticache_replication_group_reader_endpoint_address" {
  value       = var.cluster_mode_enabled ? aws_elasticache_replication_group.this.configuration_endpoint_address : aws_elasticache_replication_group.this.reader_endpoint_address
  description = "The address of the endpoint for the reader node in the replication group."
}

output "elasticache_replication_group_member_clusters" {
  value       = aws_elasticache_replication_group.this.member_clusters
  description = "The identifiers of all the nodes that are part of this replication group."
}

output "elasticache_parameter_group_id" {
  value       = aws_elasticache_parameter_group.this.id
  description = "The ElastiCache parameter group name."
}

output "security_group_id" {
  value       = aws_security_group.this.id
  description = "The ID of the Redis ElastiCache security group."
}

output "security_group_arn" {
  value       = aws_security_group.this.arn
  description = "The ARN of the Redis ElastiCache security group."
}

output "security_group_vpc_id" {
  value       = aws_security_group.this.vpc_id
  description = "The VPC ID of the Redis ElastiCache security group."
}

output "security_group_owner_id" {
  value       = aws_security_group.this.owner_id
  description = "The owner ID of the Redis ElastiCache security group."
}

output "security_group_name" {
  value       = aws_security_group.this.name
  description = "The name of the Redis ElastiCache security group."
}

output "security_group_description" {
  value       = aws_security_group.this.description
  description = "The description of the Redis ElastiCache security group."
}

output "security_group_ingress" {
  value       = aws_security_group.this.ingress
  description = "The ingress rules of the Redis ElastiCache security group."
}

output "security_group_egress" {
  value       = aws_security_group.this.egress
  description = "The egress rules of the Redis ElastiCache security group."
}

output "elasticache_auth_token" {
  description = "The Redis Auth Token."
  value       = aws_elasticache_replication_group.this.auth_token
  sensitive   = true
}

output "elasticache_port" {
  description = "The Redis port."
  value       = aws_elasticache_replication_group.this.port
}