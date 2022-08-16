###########
# IAM users
############
provider "aws" {
  region = "us-east-2"
  shared_credentials_file = "~/.aws/credentials"
  profile = "default"
}

module "iam_user2" {
  source = "../../../modules/IAM/iam-user"

  name = "ramesh-wal"

  create_iam_user_login_profile = false
  create_iam_access_key         = false
#   # User "test" has uploaded his public key here - https://keybase.io/test/pgp_keys.asc
#  pgp_key = "keybase:test"
#
#  password_reset_required = false
#
#  # SSH public key
#  upload_iam_user_ssh_key = false
#
#  ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0sUjdTEcOWYgQ7ESnHsSkvPUO2tEvZxxQHUZYh9j6BPZgfn13iYhfAP2cfZznzrV+2VMamMtfiAiWR39LKo/bMN932HOp2Qx2la14IbiZ91666FD+yZ4+vhR2IVhZMe4D+g8FmhCfw1+zZhgl8vQBgsRZIcYqpYux59FcPv0lP1EhYahoRsUt1SEU2Gj+jvgyZpe15lnWk2VzfIpIsZ++AeUqyHoJHV0RVOK4MLRssqGHye6XkA3A+dMm2Mjgi8hxoL5uuwtkIsAll0kSfL5O2G26nsxm/Fpcl+SKSO4gs01d9V83xiOwviyOxmoXzwKy4qaUGtgq1hWncDNIVG/aQ=="
#
}
module "iam_user3" {
  source = "../../../modules/IAM/iam-user"

  name = "sanjiv-wal"

  create_iam_user_login_profile = false
  create_iam_access_key         = false
#    # User "test" has uploaded his public key here - https://keybase.io/test/pgp_keys.asc
#  pgp_key = "keybase:test"
#
#  password_reset_required = false
#
#  # SSH public key
#  upload_iam_user_ssh_key = false
#
#  ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0sUjdTEcOWYgQ7ESnHsSkvPUO2tEvZxxQHUZYh9j6BPZgfn13iYhfAP2cfZznzrV+2VMamMtfiAiWR39LKo/bMN932HOp2Qx2la14IbiZ91666FD+yZ4+vhR2IVhZMe4D+g8FmhCfw1+zZhgl8vQBgsRZIcYqpYux59FcPv0lP1EhYahoRsUt1SEU2Gj+jvgyZpe15lnWk2VzfIpIsZ++AeUqyHoJHV0RVOK4MLRssqGHye6XkA3A+dMm2Mjgi8hxoL5uuwtkIsAll0kSfL5O2G26nsxm/Fpcl+SKSO4gs01d9V83xiOwviyOxmoXzwKy4qaUGtgq1hWncDNIVG/aQ=="

}
module "iam_user4" {
  source = "../../../modules/IAM/iam-user"

  name = "sashi-wal"

  create_iam_user_login_profile = false
  create_iam_access_key         = false
#    # User "test" has uploaded his public key here - https://keybase.io/test/pgp_keys.asc
#  pgp_key = "keybase:test"
#
#  password_reset_required = false
#
#  # SSH public key
#  upload_iam_user_ssh_key = false
#
#  ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0sUjdTEcOWYgQ7ESnHsSkvPUO2tEvZxxQHUZYh9j6BPZgfn13iYhfAP2cfZznzrV+2VMamMtfiAiWR39LKo/bMN932HOp2Qx2la14IbiZ91666FD+yZ4+vhR2IVhZMe4D+g8FmhCfw1+zZhgl8vQBgsRZIcYqpYux59FcPv0lP1EhYahoRsUt1SEU2Gj+jvgyZpe15lnWk2VzfIpIsZ++AeUqyHoJHV0RVOK4MLRssqGHye6XkA3A+dMm2Mjgi8hxoL5uuwtkIsAll0kSfL5O2G26nsxm/Fpcl+SKSO4gs01d9V83xiOwviyOxmoXzwKy4qaUGtgq1hWncDNIVG/aQ=="
#
}
module "iam_user5" {
  source = "../../../modules/IAM/iam-user"

  name = "siva-wal"

  create_iam_user_login_profile = false
  create_iam_access_key         = false
#    # User "test" has uploaded his public key here - https://keybase.io/test/pgp_keys.asc
#  pgp_key = "keybase:test"
#
#  password_reset_required = false
#
#  # SSH public key
#  upload_iam_user_ssh_key = false
#
#  ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0sUjdTEcOWYgQ7ESnHsSkvPUO2tEvZxxQHUZYh9j6BPZgfn13iYhfAP2cfZznzrV+2VMamMtfiAiWR39LKo/bMN932HOp2Qx2la14IbiZ91666FD+yZ4+vhR2IVhZMe4D+g8FmhCfw1+zZhgl8vQBgsRZIcYqpYux59FcPv0lP1EhYahoRsUt1SEU2Gj+jvgyZpe15lnWk2VzfIpIsZ++AeUqyHoJHV0RVOK4MLRssqGHye6XkA3A+dMm2Mjgi8hxoL5uuwtkIsAll0kSfL5O2G26nsxm/Fpcl+SKSO4gs01d9V83xiOwviyOxmoXzwKy4qaUGtgq1hWncDNIVG/aQ=="
#
}
module "iam_user6" {
  source = "../../../modules/IAM/iam-user"

  name = "sriniwasa-wal"

  create_iam_user_login_profile = false
  create_iam_access_key         = false
#    # User "test" has uploaded his public key here - https://keybase.io/test/pgp_keys.asc
#  pgp_key = "keybase:test"
#
#  password_reset_required = false
#
#  # SSH public key
#  upload_iam_user_ssh_key = false
#
#  ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0sUjdTEcOWYgQ7ESnHsSkvPUO2tEvZxxQHUZYh9j6BPZgfn13iYhfAP2cfZznzrV+2VMamMtfiAiWR39LKo/bMN932HOp2Qx2la14IbiZ91666FD+yZ4+vhR2IVhZMe4D+g8FmhCfw1+zZhgl8vQBgsRZIcYqpYux59FcPv0lP1EhYahoRsUt1SEU2Gj+jvgyZpe15lnWk2VzfIpIsZ++AeUqyHoJHV0RVOK4MLRssqGHye6XkA3A+dMm2Mjgi8hxoL5uuwtkIsAll0kSfL5O2G26nsxm/Fpcl+SKSO4gs01d9V83xiOwviyOxmoXzwKy4qaUGtgq1hWncDNIVG/aQ=="
#
}
module "iam_user8" {
  source = "../../../modules/IAM/iam-user"

  name = "tarun-wal"

  create_iam_user_login_profile = false
  create_iam_access_key         = false
#    # User "test" has uploaded his public key here - https://keybase.io/test/pgp_keys.asc
#  pgp_key = "keybase:test"
#
#  password_reset_required = false
#
#  # SSH public key
#  upload_iam_user_ssh_key = false
#
#  ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0sUjdTEcOWYgQ7ESnHsSkvPUO2tEvZxxQHUZYh9j6BPZgfn13iYhfAP2cfZznzrV+2VMamMtfiAiWR39LKo/bMN932HOp2Qx2la14IbiZ91666FD+yZ4+vhR2IVhZMe4D+g8FmhCfw1+zZhgl8vQBgsRZIcYqpYux59FcPv0lP1EhYahoRsUt1SEU2Gj+jvgyZpe15lnWk2VzfIpIsZ++AeUqyHoJHV0RVOK4MLRssqGHye6XkA3A+dMm2Mjgi8hxoL5uuwtkIsAll0kSfL5O2G26nsxm/Fpcl+SKSO4gs01d9V83xiOwviyOxmoXzwKy4qaUGtgq1hWncDNIVG/aQ=="
#
}

#####################################################################################
# IAM group for superadmins with full Administrator access
#####################################################################################
module "iam_group_superadmins" {
  source = "../../../modules/IAM/iam-group-with-policies"

  name = "superadmins"

  group_users = [
    module.iam_user8.iam_user_name,
    module.iam_user3.iam_user_name
  ]

  custom_group_policy_arns = [
    "arn:aws:iam::aws:policy/AdministratorAccess",
    "arn:aws:iam::073036004875:policy/MFA-Policy"
    

    
  ]
  tags = {
    Terraform   = "true"
    Environment = "UAT"
  }  
}
#####################################################################################
# IAM group for users with Read only access
#####################################################################################
module "iam_group_readOnly" {
  source = "../../../modules/IAM/iam-group-with-policies"

  name = "read-only"
  
  group_users = [
    module.iam_user2.iam_user_name,
  #  module.iam_user3.iam_user_name,
    module.iam_user4.iam_user_name,
    module.iam_user5.iam_user_name,
    module.iam_user6.iam_user_name,
  ]

  custom_group_policy_arns = [
    "arn:aws:iam::aws:policy/ReadOnlyAccess",
    "arn:aws:iam::073036004875:policy/MFA-Policy"
    
   # "module.iam_policy.arn",
  # "arn:aws:iam::aws:policy/MFA-Policy"
  
  ]
  tags = {
    Terraform   = "true"
    Environment = "UAT"
  }  
}

module "iam_group_database_developers" {
  source = "../../../modules/IAM/iam-group-with-policies"

  name = "uat-database-developers"

  group_users = []

  custom_group_policy_arns = [
    "arn:aws:iam::aws:policy/ReadOnlyAccess",
    "arn:aws:iam::aws:policy/AmazonRDSFullAccess",
  ]
  tags = {
    Terraform   = "true"
    Environment = "UAT"
  }  
}

#########################################
# IAM policy
#########################################
module "iam_policy" {
  source = "../../../modules/IAM/iam-policy"

  name        = "MFA-Policy"
  path        = "/"
  description = "my MFA Policy"
  

  policy = <<EOF
{
        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "AllowViewAccountInfo",
                "Effect": "Allow",
                "Action": [
                    "iam:GetAccountPasswordPolicy",
                    "iam:ListVirtualMFADevices"
                ],
                "Resource": "*"
            },
            {
                "Sid": "AllowManageOwnPasswords",
                "Effect": "Allow",
                "Action": [
                    "iam:ChangePassword",
                    "iam:GetUser"
                ],
                "Resource": "arn:aws:iam::*:user/$${aws:username}"
            },
            {
                "Sid": "AllowManageOwnAccessKeys",
                "Effect": "Allow",
                "Action": [
                    "iam:CreateAccessKey",
                    "iam:DeleteAccessKey",
                    "iam:ListAccessKeys",
                    "iam:UpdateAccessKey"
                ],
                "Resource": "arn:aws:iam::*:user/$${aws:username}"
            },
            {
                "Sid": "AllowManageOwnSigningCertificates",
                "Effect": "Allow",
                "Action": [
                    "iam:DeleteSigningCertificate",
                    "iam:ListSigningCertificates",
                    "iam:UpdateSigningCertificate",
                    "iam:UploadSigningCertificate"
                ],
                "Resource": "arn:aws:iam::*:user/$${aws:username}"
            },
            {
                "Sid": "AllowManageOwnSSHPublicKeys",
                "Effect": "Allow",
                "Action": [
                    "iam:DeleteSSHPublicKey",
                    "iam:GetSSHPublicKey",
                    "iam:ListSSHPublicKeys",
                    "iam:UpdateSSHPublicKey",
                    "iam:UploadSSHPublicKey"
                ],
                "Resource": "arn:aws:iam::*:user/$${aws:username}"
            },
            {
                "Sid": "AllowManageOwnGitCredentials",
                "Effect": "Allow",
                "Action": [
                    "iam:CreateServiceSpecificCredential",
                    "iam:DeleteServiceSpecificCredential",
                    "iam:ListServiceSpecificCredentials",
                    "iam:ResetServiceSpecificCredential",
                    "iam:UpdateServiceSpecificCredential"
                ],
                "Resource": "arn:aws:iam::*:user/$${aws:username}"
            },
            {
                "Sid": "AllowManageOwnVirtualMFADevice",
                "Effect": "Allow",
                "Action": [
                    "iam:CreateVirtualMFADevice",
                    "iam:DeleteVirtualMFADevice"
                ],
                "Resource": "arn:aws:iam::*:mfa/$${aws:username}"
            },
            {
                "Sid": "AllowManageOwnUserMFA",
                "Effect": "Allow",
                "Action": [
                    "iam:DeactivateMFADevice",
                    "iam:EnableMFADevice",
                    "iam:ListMFADevices",
                    "iam:ResyncMFADevice"
                ],
                "Resource": "arn:aws:iam::*:user/$${aws:username}"
            },
            {
                "Sid": "DenyAllExceptListedIfNoMFA",
                "Effect": "Deny",
                "NotAction": [
                    "iam:CreateVirtualMFADevice",
                    "iam:EnableMFADevice",
                    "iam:GetUser",
                    "iam:ListMFADevices",
                    "iam:ListVirtualMFADevices",
                    "iam:ResyncMFADevice",
                    "iam:ChangePassword",
                    "sts:GetSessionToken"
                ],
                "Resource": "*",
                "Condition": {
                    "BoolIfExists": {
                        "aws:MultiFactorAuthPresent": "false"
                    }
                }
            }
        ]
    }
    EOF
  tags = {
    Terraform   = "true"
    Environment = "UAT"
  }  
}



