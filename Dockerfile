# Dockerfile
FROM archlinux:latest

RUN yes | pacman -Syu jre21-openjdk-headless vim darkhttpd wget docker

RUN useradd -ms /bin/bash server
WORKDIR /home/server
COPY . .
RUN chown -hR server /home/server
RUN usermod -aG docker server
USER server
EXPOSE 8000

CMD ["bash", "run.sh"]

