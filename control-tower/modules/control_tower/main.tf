resource "aws_organizations_account" "workload_account" {
  name  = var.account_name
  email = var.account_email
  role_name = "OrganizationAccountAccessRole"
}

resource "aws_controltower_account_factory" "account" {
  account_name = var.account_name
  email        = var.account_email
  ssouser_email = var.ssouser_email
  ssouser_firstname = var.ssouser_firstname
  ssouser_lastname = var.ssouser_lastname
  managed_ou = var.managed_ou
}
