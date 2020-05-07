#!/bin/bash

# update repo and software packages
apt-get update && apt-get upgrade

# install nginx / mariadb / php and extensions
apt-get install -y nginx
apt-get install -y mariadb-server mariadb-client
apt-get install -y php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli \
php7.3-common php7.3-json php7.3-opcache php7.3-readline php7.3-mbstring \
php7.3-xml php7.3-gd php7.3-curl

# create nginx server block
cp -pr ./default.conf /etc/nginx/sites-available/default

# web directory in default
mkdir /var/www/localhost

# install phpMyAdmin and configure
tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz
mv phpMyAdmin-5.0.2-all-languages /var/www/localhost/phpmyadmin
cp -pr ./config.sample.inc.php /var/www/localhost/phpmyadmin/config.inc.php

# Import the create_tables.sql to create tables for phpMyAdmin.
service mysql start
# mysql < /var/www/localhost/phpmyadmin/sql/create_tables.sql -u root -p
# Add the user and grant permission to phpMyAdmin’s database.
# Add the user and grant permission to ALL databases *.*
# test with mariadb -u 'user' -p
echo "GRANT ALL PRIVILEGES ON *.* TO 'vscabell'@'localhost' IDENTIFIED BY '1234';"| mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

# SSL CONFIG
openssl req -x509 -nodes -days 365 \
	-newkey rsa:2048 \
	-subj "/C=BR/ST=Sao Paulo/L=Sao Paulo/OU=IT/CN=localhost" \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt
chmod 600 /etc/ssl/private/nginx-selfsigned.key /etc/ssl/certs/nginx-selfsigned.crt

# remove files
rm -rf phpMyAdmin-5.0.2-all-languages.tar.gz
rm -f ./default.conf
rm -f ./config.sample.inc.php
rm -f ./deploy.sh
