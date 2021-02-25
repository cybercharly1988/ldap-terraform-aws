variable "region" {
  description = "It will define the AWS region"
  default     = "us-west-2"
}
variable "key_name" {
  description = "This is the pem key created to access to the EC2 instances"
  default     = "terraform-aws-dropbox-personal"
}
variable "instance_type" {
  description = "kind of VM to be created"
}
variable "tags" {
  description = "tags values to identify the deployment"
}
variable "ami_id" {
  description = "Amazon Machin Image to be deployed"
}
variable "sg_name" {
  description = "Security Group to be created and attached to the VM"
}
variable "ingress_rules" {
  description = "Ingress  rules to be configure in AWS"
}
variable "egress_rules" {
  description = "Egress  rules to be configure in AWS"
}
variable "aws_access_key" {
}
variable "aws_secret_key" {
}