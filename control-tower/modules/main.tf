data "aws_region" "current" {}

data "aws_organizations_organization" "example" {}

data "aws_organizations_organizational_units" "example" {
  parent_id = data.aws_organizations_organization.example.roots[0].id
}

resource "aws_controltower_control" "example" {
  control_identifier = "arn:aws:controltower:${data.aws_region.current.name}::control/AWS-GR_EC2_VOLUME_INUSE_CHECK"
  target_identifier = [
    for x in data.aws_organizations_organizational_units.example.children :
    x.arn if x.name == "Infrastructure"
  ][0]

  parameters {
    key   = "AllowedRegions"
    value = jsonencode(["us-east-1"])
  }
  
resource "aws_controltower_landing_zone" "example" {
  manifest_json = file("${path.module}/LandingZoneManifest.json")
  version       = "3.2"
}  
}

#importexistinginfra
#mport Control Tower Controls using their organizational_unit_arn,control_identifier

import {
  to = aws_controltower_control.example
  id = "arn:aws:organizations::123456789101:ou/o-qqaejywet/ou-qg5o-ufbhdtv3,arn:aws:controltower:us-east-1::control/WTDSMKDKDNLE"
}

#import a Control Tower Landing Zone using the id

import {
  to = aws_controltower_landing_zone.example
  id = "1A2B3C4D5E6F7G8H"
}

#Using terraform import, import Control Tower Controls using their organizational_unit_arn/control_identifier

% terraform import aws_controltower_control.example arn:aws:organizations::123456789101:ou/o-qqaejywet/ou-qg5o-ufbhdtv3,arn:aws:controltower:us-east-1::control/WTDSMKDKDNLE

#import a Control Tower Landing Zone using the id

% terraform import aws_controltower_landing_zone.example 1A2B3C4D5E6F7G8H
