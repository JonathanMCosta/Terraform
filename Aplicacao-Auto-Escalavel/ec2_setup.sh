#!/bin/bash
yum update -y
yum install -y httpd
echo 'Apache Application' > /var/www/html/index.html
service httpd start

sudo yum install -y epel-release
sudo yum install -y stress
