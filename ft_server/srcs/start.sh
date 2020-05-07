#!/bin/bash
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vscabell <vscabell@student.42sp.org.br>    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/26 16:34:56 by vscabell          #+#    #+#              #
#    Updated: 2020/04/26 16:34:56 by vscabell         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

service nginx start
service mysql start
service php7.3-fpm start
rm deploy.sh
tail -F /dev/null
