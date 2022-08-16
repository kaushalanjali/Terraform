provider "aws" {
  region = "eu-central-1"
}

module "secret-manager" {
  source = "../../../modules/SM"
  description = "Passwords for my databases."
  name = "DB_passwords"
  kms_key_id = "1234abcd-12ab-34cd-56ef-1234567890ab"

  secrets = [
    {
      secret_key_value = {
        db_test_password = "ASD123asd"
        db_dev_password = "asd123ASD"
      }
    }
  ]
}