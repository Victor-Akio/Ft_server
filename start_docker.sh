# File to start the docker script, run this only on building the project
sudo docker build -t webserver .
sudo docker run --name ft_server -it -p 80:80 -p 443:443 webserver