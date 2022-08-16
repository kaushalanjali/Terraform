# module.secret-manager

Used to create a secret in the form key = value 

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Specifies the friendly name of the new secret. The secret name can consist of uppercase letters, lowercase letters, digits, and any of the following characters: /_+=.@- | string | no | yes |
| description | A description of the secret. | string | no | no |
| kms_key_id | Specifies the ARN or Id of the AWS KMS customer master key (CMK) to be used to encrypt the secret values in the versions stored in this secret. If you don't specify this value, then Secrets Manager defaults to using the AWS account's default CMK (the one named aws/secretsmanager). If the default KMS CMK with that name doesn't yet exist, then AWS Secrets Manager creates it for you automatically the first time. | string | aws/secretsmanager | no |
| policy | A valid JSON document representing a resource policy | string | no | no |
| recovery_window_in_days | Specifies the number of days that AWS Secrets Manager waits before it can delete the secret. This value can be 0 to force deletion without recovery or range from 7 to 30 | number | no | 30 |
| tags |  Specifies a key-value map of user-defined tags that are attached to the secret. | map(string) | no | no |
| secret_string | Specifies text data that you want to encrypt and store in this version of the secret. This is required if secret_binary is not set. | list(map(string)) | no | yes |

## Outputs

| Name | Description |
|------|-------------|
| aws_secretsmanager_secret_id | The ID of aws_secretmanager_secret |
| secret | Stored secred value |