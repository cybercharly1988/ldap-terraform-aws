# ldap-terraform-aws

## Summary

Terraform code to deploy an AWS instance with CentOS 7 and bootstraping a LDAP installation

## Usage

### Pre-requisites
* Create a terraform.auto.tvars file in the same location that all the terraform code
* Create a .pem key in the AWS availability zone that you are deploying the EC2 instance

## Getting Started
**Example**

```terraform
aws_access_key = "XXXXXXXXXXXXXXXXXXXXXXXXXX"
aws_secret_key = "XXXXXXXXXXXXXXXXXXXXXXXXXX"

ami_id        = "ami-0686851c4e7b1a8e1"
instance_type = "t2.micro"
tags          = { Name = "Foxpass_VM", Environment = "Foxpass_Env" }
sg_name       = "foxpass-sg-rules"
ingress_rules = [
  {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = "389"
    to_port     = "389"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = "636"
    to_port     = "636"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]
egress_rules = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]
```

**Outputs**
| Name | Description |
|------|-------------|
| instance_ip | Public Instance EC2 IP Address |

### Notable
* Nothing to mention yet

## Owners
| Name | Email |
|------|-------|
| Juan Carlos Perez Hernandez | jc.przhdz@gmail.com

# CHANGELOG
***
### Version 1.0.0
***Added***
* Added the terraform code to create an EC2 instance 
* Added a post-configuration using a bash script to install LDAP
* Added the README




