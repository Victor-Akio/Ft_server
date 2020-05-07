#!/bin/bash

service mysql start

#config site
mkdir /var/www/localhost && touch /var/www/localhost/index.php
echo "<?php phpinfo(); ?>" >> /var/www/localhost/index.php

#config access
chown -R www-data /var/www/*
chmod -R 755 /var/www/*

#SSL certificate
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=BR/ST=SP/L=SP/O=42 School/OU=joguntij/CN=localhost"

# LINK SITE
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

#SQL config
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* to 'root'@'localhost';" |  mysql -u root --skip-password
echo "FLUSH PRIVILEGES" | mysql -u root --skip-password
echo "UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE user='root';" | mysql -u root --skip-password

#PHP config
mkdir -p /var/www/localhost/phpmyadmin/
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz --strip-components 1 -C /var/www/localhost/phpmyadmin
mv ./temp/php_config.php /var/www/localhost/phpmyadmin/config.inc.php

#Wordpress config
wget -c https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
mv wordpress/ /var/www/localhost

service php7.3-fpm start
service nginx start
bash