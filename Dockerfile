# Dockerfile
ARG WDR=/home/server

FROM archlinux:latest

RUN yes | pacman -Syu vim darkhttpd wget 

RUN wget https://download.oracle.com/graalvm/21/latest/graalvm-jdk-21_linux-x64_bin.tar.gz -O /tmp/archive.tar.gz \
	&& mkdir -p /opt \
	&& tar -vxzf /tmp/archive.tar.gz -C /opt \
	&& ln -s /opt/graalvm-jdk-21.0.7+8.1/bin/java /bin/java \
	&& rm /tmp/archive.tar.gz
	
RUN useradd -ms /bin/bash server

WORKDIR $WDR
COPY . .
RUN chown -hR server /home/server
USER server
EXPOSE 8000

CMD ["bash", "run.sh"]

