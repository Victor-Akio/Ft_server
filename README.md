# Ft_server

This project consist in discovering the "docker" technology and use it to install a complete web server. This server will run multiples services: Wordpress, phpMyAdmin, and a SQL database.

Also, it is important training of script production to optimze the execution of the server.

CMD build:
$> docker build -t name .

CMD run:
$> docker run --name aname -it -p 80:80 -p 443:443 name

Utils : 
- Web server with Nginx
- SQL Database with MariaDB
- Database web admin with PhpMyAdmin
- OpenSource CMS with Wordpress
- Self-signed SSL certificate with OpenSSL