#!/bin/bash
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
usermod -a -G apache ec2-user
chown -R ec2-user:apache /var/www
chmod 2775 /var/www
find /var/www -type d -exec chmod 2775 {} \;
find /var/www -type f -exec chmod 0664 {} \;
curl http://169.254.169.254/latest/meta-data/hostname > /var/www/html/index.html
