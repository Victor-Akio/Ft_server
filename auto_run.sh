#!/bin/bash

sudo docker build -t ftserver .
sudo docker run --name ft_server -it -p 80:80 -p 443:443 ftserver
echo -e "\e[32mRunning containers:\e[0m"
sudo docker ps
echo -e "\e[32mLogs:\e[0m"
sudo docker logs ftserver