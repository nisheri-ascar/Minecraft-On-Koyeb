# Dockerfile
FROM archlinux:latest

RUN yes | pacman -Syu vim darkhttpd wget 

RUN useradd -ms /bin/bash server

# Download and extract JRE, then symlink java binary
RUN wget https://github.com/ibmruntimes/semeru21-certified-binaries/releases/download/jdk-21.0.7%2B6_openj9-0.51.0/ibm-semeru-certified-jre_x64_linux_21.0.7.0.tar.gz -O /tmp/j9.tar.gz \
    && mkdir -p /opt \
    && tar -xzf /tmp/j9.tar.gz -C /opt \
    && ln -s /opt/jdk-21.0.7+6-jre/bin/java /bin/java \
    && rm /tmp/j9.tar.gz


WORKDIR /home/server
COPY . .
RUN chown -hR server /home/server
USER server
EXPOSE 8000

CMD ["bash", "run.sh"]

