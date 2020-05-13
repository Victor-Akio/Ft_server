#!/bin/bash

# start MySQL database
service mysql start

# Change permissions
chown -R www-data /var/www/*
chmod -R 755 /var/www/*

# Generate SSL keys
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=BR/ST=SP/L=SP/O=42_SP/OU=vminomiy/CN=localhost" 

# Configurate NGINX
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
rm -rf /etc/nginx/sites-enabled/default

# Configurate MySQL
echo "CREATE DATABASE wordpress;" | mysql -y root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -y root --skip-password
echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -y root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -y root --skip-password

# Generate PHP My Admin config
mkdir -p /var/www/localhost/phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz
tar -xvf phpMyAdmin-5.0.2-all-languages.tar.gz --strip-components 1 -C /var/www/localhost/phpmyadmin
mv ./tmp/phpmyadmin.inc.php /var/www/localhost/phpmyadmin/config.inc.php

# Generate WP config
wget -c https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
mv wordpress/ /var/www/localhost
mv /tmp/wp-config.php /var/www/localhost/wordpress

# start php and nginx server
service php7.3-fpm start
service nginx start

bash