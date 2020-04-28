#OS
FROM debian:buster

#INSTALL - utils
RUN apt-get -y update
RUN apt-get -y upgrade
#INSTALL - NGINX
RUN apt-get -y install nginx
#INSTALL - wget
RUN apt-get -y install wget
#INSTALL -  MySQL-Server
RUN apt-get -y install default-mysql-server
#INSTALL - MAriaDB
RUN apt-get -y install mariadb-server
#INSTALL - PHP
RUN apt-get -y install php-fpm php-mysql php-mbstring php-zip php-gd
#Clean already installed packages
RUN apt-get clean

