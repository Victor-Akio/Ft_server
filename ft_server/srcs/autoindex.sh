#!/bin/bash

CONFIG_FILE='/etc/nginx/sites-available/default'

if [ "$1" == "on" ] || [ "$1" == "off" ]
then
	if [ "$1" == "on" ]
	then
		echo "Activate autoindex"
		sed -i 's/autoindex off/autoindex on/' $CONFIG_FILE;
		service nginx restart;
		echo -e "\e[32mAutoindex is ON\e[39m"
	else
		echo "Deactivate autoindex"
		sed -i 's/autoindex on/autoindex off/' $CONFIG_FILE;
		service nginx restart;
		echo -e "\e[31mAutoindex is OFF\e[39m"
	fi
else
	echo -e "\e[31mError\e[39m"
	echo "This value does not exist in the index"
	echo "Please select [on | off]"
fi
