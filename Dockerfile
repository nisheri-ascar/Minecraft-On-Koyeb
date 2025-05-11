# Dockerfile
FROM debian:latest

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install openjdk-21-jre-headless vim busybox -y

WORKDIR /home/server
COPY * .
EXPOSE 8000
RUN useradd -ms /bin/bash server
RUN chown -hR server /home/server
USER server

CMD ["bash", "webserve.sh"]

