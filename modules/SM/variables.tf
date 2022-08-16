variable "name" {
  description = "Specifies the friendly name of the new secret. The secret name can consist of uppercase letters, lowercase letters, digits, and any of the following characters: /_+=.@-"
  type        = string
}

variable "description" {
  description = "A description of the secret."
  type = string
}

variable "kms_key_id" {
  description = "Specifies the ARN or Id of the AWS KMS customer master key (CMK) to be used to encrypt the secret values in the versions stored in this secret. If you don't specify this value, then Secrets Manager defaults to using the AWS account's default CMK (the one named aws/secretsmanager). If the default KMS CMK with that name doesn't yet exist, then AWS Secrets Manager creates it for you automatically the first time."
  type = string
  default = ""
}

variable "policy" {
  description = "A valid JSON document representing a resource policy."
  type = string
  default = ""
}

variable "recovery_window_in_days" {
  description = "Specifies the number of days that AWS Secrets Manager waits before it can delete the secret. This value can be 0 to force deletion without recovery or range from 7 to 30 days. "
  type = number
  default = 30
}

variable "tags" {
  description = "A map of tags to add to parameter group."
  type        = map(string)
  default     = {}
}

variable "secrets" {
  description = "List of secrets to keep in AWS Secrets Manager."
  type        = any
  default     = []
}