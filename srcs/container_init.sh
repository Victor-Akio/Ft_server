service mysql start

# create html folder
mkdir /var/www/html && touch /var/www/html/index.php
echo "<?php phpinfo(); ?>" >> /var/www/html/index.php

# Config NGINX
mv ./tmp/nginx-conf /etc/nginx/sites-available/localhost
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost
rm -rf /etc/nginx/sites-enabled/default

service php7.3-fpm start
service nginx start
bash
