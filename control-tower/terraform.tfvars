# Control Tower - Basic Account Creation
account_name       = "dev-account"
account_email      = "dev-team@example.com"
ssouser_email      = "developer@example.com"
ssouser_firstname  = "Dev"
ssouser_lastname   = "Team"
managed_ou         = "Sandbox"

# VPC and Subnets
vpc_cidr           = "10.0.0.0/16"
private_subnets    = ["10.0.1.0/24", "10.0.2.0/24"]
azs                = ["us-east-1a", "us-east-1b"]

# EC2 Instance
ami                = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI with SSM
instance_type      = "t3.micro"
