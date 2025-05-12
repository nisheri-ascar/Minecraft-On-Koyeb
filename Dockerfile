# Dockerfile
FROM archlinux:latest

RUN yes | pacman -Syu vim darkhttpd wget #jre21-openjdk-headless

RUN useradd -ms /bin/bash server
WORKDIR /home/server
COPY . .
RUN chown -hR server /home/server
USER server
EXPOSE 8000


# Try out corretto
RUN wget https://corretto.aws/downloads/latest/amazon-corretto-21-x64-linux-jdk.tar.gz && tar -xvf amazon-corretto-21-x64-linux-jdk.tar.gz
COPY ./amazon-corretto-21.0.7.6.1-linux-x64/* /


CMD ["bash", "run.sh"]

