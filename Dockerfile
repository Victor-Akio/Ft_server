FROM debian:buster

LABEL	version="1.0.0" \
	maintainer="Fabio Guedes"

RUN ["apt-get", "update", "-y"]
RUN ["apt-get", "upgrade", "-y"]
RUN ["apt-get", "install", "nginx", "-y"]

RUN ["apt-get", "clean"]

COPY ["src/start.sh", "/"]
#ENTRYPOINT [ "sh", "start.sh" ]