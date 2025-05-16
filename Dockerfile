# Dockerfile
FROM archlinux:latest

RUN yes | pacman -Syu vim darkhttpd wget #jre8-openjdk-headless

RUN useradd -ms /bin/bash server

# Download and extract JRE, then symlink java binary
RUN wget https://github.com/ibmruntimes/semeru8-binaries/releases/download/jdk8u452-b09_openj9-0.51.0/ibm-semeru-open-jre_x64_linux_8u452b09_openj9-0.51.0.tar.gz -O /tmp/j9.tar.gz \
    && mkdir -p /opt \
    && tar -xzf /tmp/j9.tar.gz -C /opt \
    && ln -s /opt/jdk8u452-b09-jre/bin/java /bin/java \
    && rm /tmp/j9.tar.gz


WORKDIR /home/server
COPY . .
RUN chown -hR server /home/server
USER server
EXPOSE 8000

CMD ["bash", "run.sh"]

