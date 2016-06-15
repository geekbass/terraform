# Terraform Examples for AWS and Vsphere
My Terraform Examples, specifically for Vsphere Development. Infrastructure-as-Code! Another absolutely brilliant project by the genius minds at Hashicorp.

## What is Terraform?
From Terraform.io: "Terraform provides a common configuration to launch infrastructure — from physical and virtual servers to email and DNS providers. Once launched, Terraform safely and efficiently changes infrastructure as the configuration is evolved." Infrastructure-as-Code!!!!

## Getting Started with Terraform:
https://www.terraform.io/intro/

## Installing Terraform:
https://www.terraform.io/downloads.html

## Other Important Info:
Be sure to check out the Environment Variable functionality so that you dont have to place username/password/keyfiles etc in config files. AWS and VSphere providers support it.

## Terraform Commands:

See/Check the Deployment Configs

```bash
terraform plan
```

Build the Infra from the .tf file/plan

```bash
terraform apply
```

Show status of the infra

```bash
terraform show
```

Blow away the running deployment

```bash
terraform destroy
```

## To Dos
Add Provisioners -> Specifically Take a look for Ansible

Add Additional Examples to AWS: CloudFormation, ELB, S3, etc...

Packer Integration for AMI/VMware Templates
