# Dockerfile
FROM ubuntu:latest

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install openjdk-21-jre-headless vim darkhttpd wget busybox -y

RUN useradd -ms /bin/bash server
WORKDIR /home/server
COPY . .
COPY web/ /var/www/html
RUN chown -hR server /home/server
USER server
EXPOSE 8000

CMD ["bash", "run.sh"]

