#!/bin/bash
cd /home/ec2-user
echo "Hello!!" > test.txt
yum update -y
echo "Install and configure web server"
yum install -y httpd
systemctl enable httpd
systemctl start httpd
echo '<html><h1>Hello From Your Web Server, Fellas!</h1></html>' > /var/www/html/index.html