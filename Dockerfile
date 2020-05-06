FROM debian:buster

LABEL version="1.0.0" \
    maintainer="vminomiy"

RUN ["apt-get", "update", "-y"]
RUN ["apt-get", "upgrade", "-y"]

RUN ["apt-get", "install", "nginx", "-y"]
RUN ["apt-get", "install", "default-mysql-server", "-y"]

RUN ["apt-get", "clean"]

COPY  ["srcs/start.sh", "/"]

ENTRYPOINT ["sh", "start.sh"]