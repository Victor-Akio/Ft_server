# OS to be used
FROM debian:buster

# Naming the version and maintainer
LABEL version="1.0.0" \
    maintainer="vminomiy"

# Copy archives to container
COPY ./srcs/start.sh ./
COPY ./srcs/nginx-conf ./etc/nginx/sites-available/localhost
COPY ./srcs/phpmyadmin.inc.php ./var
COPY ./srcs/wp-config.php ./tmp/var

# Installing every tool necessary to this server
RUN ["apt-get", "update", "-y"]
RUN ["apt-get", "upgrade", "-y"]
RUN ["apt-get", "install", "nginx", "-y"]
RUN ["apt-get", "install", "default-mysql-server", "-y"]
RUN ["apt-get", "install", "php7.3", "php-mysql", "php-fpm", "php-cli", "php-mbstring", "-y"]
RUN ["apt-get", "install", "wget", "-y"]

# Cleaning the installers
RUN ["apt-get", "clean"]

# When starting container, start every application necessary
CMD bash start.sh

#Exposing Port to have access outside the container.
EXPOSE 80 443