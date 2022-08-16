output "aws_secretsmanager_secret_id" {
  description = "Aws secretsmanager secret id."
  value       = aws_secretsmanager_secret.this.id
}

output "secret" {
  description = "List od secrets."
  value = jsondecode(aws_secretsmanager_secret_version.this.secret_string)[*]
}