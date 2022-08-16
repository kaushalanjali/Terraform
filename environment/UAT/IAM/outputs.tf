

output "iam_account_id" {
  description = "IAM AWS account id"
  value       = module.iam_group_superadmins.aws_account_id
}

output "group_arn" {
  description = "IAM group arn"
  value       = module.iam_group_superadmins.group_arn
}

output "group_users" {
  description = "List of IAM users in IAM group"
  value       = module.iam_group_superadmins.group_users
}

output "iam_user_name" {
  description = "The user's name"
  value       = module.iam_user2[*].iam_user_name 
}
output "group_name" {
  description = "IAM group name"
  value       = module.iam_group_superadmins.group_name
}

output "arn" {
  description = "The ARN assigned by AWS to this policy"
  value       = module.iam_policy.arn
}


output "iam_user_arn" {
  description = "The ARN assigned by AWS for this user"
  value       = module.iam_user2[*].iam_user_arn
}

output "iam_user_unique_id" {
  description = "The unique ID assigned by AWS"
  value       = module.iam_user2[*].iam_user_unique_id
}

output "iam_user_login_profile_key_fingerprint" {
  description = "The fingerprint of the PGP key used to encrypt the password"
  value       = module.iam_user2[*].iam_user_login_profile_key_fingerprint
}

output "iam_user_login_profile_encrypted_password" {
  description = "The encrypted password, base64 encoded"
  value       = module.iam_user2[*].iam_user_login_profile_encrypted_password
}

output "iam_user_login_profile_password" {
  description = "The user password"
  value       = module.iam_user2[*].iam_user_login_profile_password
  sensitive   = true
}

output "iam_access_key_id" {
  description = "The access key ID"
  value       = module.iam_user2[*].iam_access_key_id
}

output "iam_access_key_key_fingerprint" {
  description = "The fingerprint of the PGP key used to encrypt the secret"
  value       = module.iam_user2[*].iam_access_key_key_fingerprint
}

output "iam_access_key_encrypted_secret" {
  description = "The encrypted secret, base64 encoded"
  value       = module.iam_user2[*].iam_access_key_encrypted_secret
}

output "iam_access_key_secret" {
  description = "The access key secret"
  value       = module.iam_user2[*].iam_access_key_secret
  sensitive   = true
}

output "iam_access_key_ses_smtp_password_v4" {
  description = "The secret access key converted into an SES SMTP password"
  value       = module.iam_user2[*].iam_access_key_ses_smtp_password_v4
  sensitive   = true
}

output "iam_access_key_status" {
  description = "Active or Inactive. Keys are initially active, but can be made inactive by other means."
  value       = module.iam_user2[*].iam_access_key_status
}

output "pgp_key" {
  description = "PGP key used to encrypt sensitive data for this user (if empty - secrets are not encrypted)"
  value       = module.iam_user2[*].pgp_key
}

output "keybase_password_decrypt_command" {
  description = "Decrypt user password command"
  value       = module.iam_user2[*].keybase_password_decrypt_command
}

output "keybase_password_pgp_message" {
  description = "Encrypted password"
  value       = module.iam_user2[*].keybase_password_pgp_message
}

output "keybase_secret_key_decrypt_command" {
  description = "Decrypt access secret key command"
  value       = module.iam_user2[*].keybase_secret_key_decrypt_command
}

output "keybase_secret_key_pgp_message" {
  description = "Encrypted access secret key"
  value       = module.iam_user2[*].keybase_secret_key_pgp_message
}
