#!/bin/bash
#author: Juan Carlos - juan.perez@digitalonus.com
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
sudo yum install -y wget httpd
sudo setenforce 0
sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
sudo systemctl enable httpd
sudo systemctl start httpd

### START LDAP CONF

sudo yum install -y openldap openldap-servers openldap-clients nss-pam-ldapd authconfig authconfig-gtk migrationtools epel-release
sudo yum install -y expect

# Install php ldap module
#sudo yum install php70w-ldap --skip-broken -y

cat <<'EOF' >> /tmp/setuserpw.exp
#!/usr/bin/expect -f
expect_user -re "(\[^ \]+) (\[^ \]+)\n"
set user $expect_out(1,string)
set pw   $expect_out(2,string)
spawn slappasswd
expect "New password:"
send "$pw\r"
expect "Re-enter new password:"
send "$pw\r"
expect eof
EOF

sudo chmod +x /tmp/setuserpw.exp
/tmp/setuserpw.exp <<!
user1 f0xpass
!

#password for ldap will be f0xpass
PASS=`slappasswd -s f0xpass`
echo $PASS > /tmp/PASS.txt

yum install -y wget
wget 
sudo chmod +x /tmp/ldap.sh
sudo /tmp/ldap.sh f0xpass