# Dockerfile
FROM archlinux:latest

RUN pacman -Syu
RUN pacman -S jre21-openjdk-headless vim darkhttpd -y

RUN useradd -ms /bin/bash server
WORKDIR /home/server
COPY . .
RUN chown -hR server /home/server
USER server
EXPOSE 8000

CMD ["bash", "run.sh"]

