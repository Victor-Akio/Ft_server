# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vminomiy <vminomiy@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/18 16:06:05 by vminomiy          #+#    #+#              #
#    Updated: 2020/03/18 16:06:05 by vminomiy         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#OS
FROM debian:buster

#INSTALL
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install nginx
RUN apt-get -y install wget
RUN apt-get -y install default-mysql-server
RUN apt-get -y install mariadb-server
RUN apt-get -y install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp \
 php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml \
 php7.3-cli php7.3-zip php7.3-soap php7.3-imap

#COPY Files
COPY ./srcs/container_init.sh ./
COPY ./srcs/nginx.conf ./tmp/nginx-conf
COPY ./srcs/phpmyadmin.inc.php ./tmp/phpmyadmin.inc.php
COPY ./srcs/wp-config.php ./tmp/wp-config.php

#initialize
CMD bash container_init.sh