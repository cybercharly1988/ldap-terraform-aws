resource "aws_security_group" "sg_connection" {
  name = var.sg_name
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}

resource "aws_instance" "hello_foxpass" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [aws_security_group.sg_connection.name]

  user_data = filebase64("post-conf.sh")

  # user_data = <<-EOF
  #     #!/bin/bash
  #     #author: Juan Carlos - juan.perez@digitalonus.com
  #     exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
  #     sudo yum install -y wget httpd
  #     sudo setenforce 0
  #     sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
  #     sudo systemctl enable httpd
  #     sudo systemctl start httpd

  #     ### START LDAP CONF

  #     yum install -y openldap openldap-servers openldap-clients nss-pam-ldapd authconfig authconfig-gtk migrationtools epel-release
  #     EOF

  tags = var.tags
}