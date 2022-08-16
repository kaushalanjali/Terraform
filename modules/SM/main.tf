resource "aws_secretsmanager_secret" "this" {
  name = var.name
  description = var.description
  kms_key_id = var.kms_key_id
  policy = var.policy
  recovery_window_in_days = var.recovery_window_in_days
  tags = var.tags
}

resource "aws_secretsmanager_secret_version" "this" {
  secret_id = aws_secretsmanager_secret.this.id
  depends_on    = [aws_secretsmanager_secret.this]
  secret_string = lookup(element(local.secrets, 0), "secret_string")
}

locals {

  secrets = [
    for secret in var.secrets : {
      secret_string           = lookup(secret, "secret_string", null) != null ? lookup(secret, "secret_string") : (lookup(secret, "secret_key_value", null) != null ? jsonencode(lookup(secret, "secret_key_value", {})) : null)
    }
  ]
}