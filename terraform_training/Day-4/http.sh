#! /bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo service httpd start
sudo systemctl enable httpd
echo "<h1> Hi good morning....! Welcome to terraform <h1>" > /var/www/html/index.html 