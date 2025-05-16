# Dockerfile
FROM archlinux:latest

RUN yes | pacman -Syu vim darkhttpd wget jre8-openjdk-headless

RUN useradd -ms /bin/bash server
WORKDIR /home/server
COPY . .
RUN chown -hR server /home/server
USER server
EXPOSE 8000

CMD ["bash", "run.sh"]

