
#List of Control Tower controls applied to an OU

data "aws_organizations_organization" "this" {}

data "aws_organizations_organizational_units" "this" {
  parent_id = data.aws_organizations_organization.this.roots[0].id
}

data "aws_controltower_controls" "this" {

  target_identifier = [
    for x in data.aws_organizations_organizational_units.this.children :
    x.arn if x.name == "Security"
  ][0]

}
