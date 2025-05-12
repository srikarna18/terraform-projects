
## 🏗️ AWS Modular Infrastructure with Terraform (Control Tower, S3 Native Locking)

This project bootstraps a **multi-account AWS environment** using [Terraform](https://www.terraform.io/) with a fully modular structure. It provisions:

* 🔒 Secure **S3 backend with native state locking** (no DynamoDB required)
* 🧭 AWS **Control Tower** account vending (automated)
* 🌐 VPC and Subnet configuration (private-only networking)
* 🖥️ EC2 instances with **SSM, IAM roles, and tags**
* 📊 CloudWatch for logging and observability

---

### 📁 Directory Structure

```
terraform-aws-infra/
├── main.tf                     # Root - calls modules
├── variables.tf                # Shared input variables
├── outputs.tf                  # Root-level outputs
├── terraform.tfvars            # Actual values for variables
├── backend.tf                  # S3 backend with native state locking

├── s3_backend_setup/           # One-time remote state setup
│   ├── s3_backend_setup.tf
│   ├── variables.tf
│   └── terraform.tfvars

└── modules/                    # Modular infrastructure components
    ├── control_tower/          # AWS account provisioning (Org + OU + SSO)
    ├── network/                # VPC, private subnets
    ├── compute/                # EC2 instance + IAM + SSM
    └── observability/          # CloudWatch log group, retention
```

---

### ⚙️ Prerequisites

* Terraform >= 1.6 (for native S3 locking)
* AWS CLI configured with Org Admin permissions
* `jq`, `git`, and a shell terminal
* Globally unique S3 bucket name

---

### 🚀 Deployment Workflow

#### 1. 🪣 Setup S3 Backend (One-time)

```bash
cd s3_backend_setup/
terraform init
terraform apply -var-file="terraform.tfvars"
```

#### 2. 🔗 Connect Remote State

Update `backend.tf` in root with the bucket name output from the previous step.

```hcl
terraform {
  backend "s3" {
    bucket                 = "my-terraform-state-bucket-dev"
    key                    = "env/dev/terraform.tfstate"
    region                 = "us-east-1"
    encrypt                = true
    state_locking          = true
    consistency_checking   = true
  }
}
```

Then:

```bash
cd ..
terraform init
```

#### 3. 🏗️ Deploy Modular Infrastructure

```bash
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```

---

### ✨ Features

| Feature                        | Description                                     |
| ------------------------------ | ----------------------------------------------- |
| 🔐 Native S3 State Locking     | No need for DynamoDB, powered by Terraform 1.6+ |
| 🧭 Control Tower Account Setup | Account vending with email, OU, SSO user        |
| 🌐 Private-Only VPC Setup      | Secure subnets, NAT GW ready                    |
| 🔧 EC2 with SSM Support        | IAM role, cloud-init support, EBS, auto-tagging |
| 📊 CloudWatch Logging          | Log group with customizable retention           |
| ♻️ Modular Architecture        | Easy reusability and scalability                |
| 🏷️ Tagging Everywhere         | Consistent metadata for resources               |

---

### 📌 Sample Inputs – `terraform.tfvars`

```hcl
account_name       = "dev-account"
account_email      = "dev-team@example.com"
ssouser_email      = "developer@example.com"
ssouser_firstname  = "Dev"
ssouser_lastname   = "Team"
managed_ou         = "Sandbox"

vpc_cidr           = "10.0.0.0/16"
private_subnets    = ["10.0.1.0/24", "10.0.2.0/24"]
azs                = ["us-east-1a", "us-east-1b"]

ami                = "ami-0c55b159cbfafe1f0"
instance_type      = "t3.micro"
```

---

### 🧹 Teardown

⚠️ **Ensure you don’t destroy the remote S3 backend accidentally.**

```bash
terraform destroy -var-file="terraform.tfvars"
```

If you need to delete the backend bucket manually, do it **after** clearing the state and versions.

---

### 📘 Best Practices

* Use Git branches to manage `dev`, `test`, and `prod`
* Use CI/CD (GitHub Actions, GitLab CI) with separate `tfvars` per environment
* Rotate IAM credentials with roles or OIDC in pipelines
* Tag resources for cost visibility (`Owner`, `Project`, `Environment`)

---

### 🔐 IAM Permissions Example

Ensure your Terraform runner or user has:

```json
"s3:GetObject",
"s3:PutObject",
"s3:ListBucket",
"s3:DeleteObject"
```

---

### 🤝 Contributing

This setup is a production-ready baseline. Feel free to fork, extend with RDS, EKS, or Secrets Manager, and submit pull requests if shared publicly.


