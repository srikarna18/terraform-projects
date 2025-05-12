module "control_tower" {
  source = "./modules/control_tower"

  region                 = var.region
  organization_email     = var.organization_email
  log_archive_account_id = var.log_archive_account_id
  audit_account_id       = var.audit_account_id
  enable_account_factory = var.enable_account_factory
}
