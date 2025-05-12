provider "aws" {
  region = var.region
}

module "aft" {
  source  = "aws-ia/control-tower-account-factory/aws"
  version = "1.9.1"

  control_tower_enabled   = true
  log_archive_account_id  = var.log_archive_account_id
  audit_account_id        = var.audit_account_id
  aft_management_account_email = var.organization_email
}
