# Dockerfile
FROM archlinux:latest

RUN yes | pacman -Syu vim darkhttpd wget 

RUN wget -q https://download.oracle.com/graalvm/21/latest/graalvm-jdk-21_linux-x64_bin.tar.gz -O /tmp/archive.tar.gz \
	&& mkdir -p /opt \
	&& tar -vxzf /tmp/archive.tar.gz -C /opt \
	&& ln -s /opt/graalvm-jdk-21.0.7+8.1/bin/java /bin/java

WORKDIR /tmp
RUN export paperServerVersion=1.21.4 \
	&& export paperBuildNumber=230 \
	&& echo "Patching jar" \
 	&& wget -q https://api.papermc.io/v2/projects/paper/versions/${paperServerVersion}/builds/${paperBuildNumber}/downloads/paper-${paperServerVersion}-${paperBuildNumber}.jar -O /tmp/server.jar \
  	&& java -jar /tmp/server.jar --paper-dir=/tmp/ --initSettings \
	&& mkdir -p /home/server/server \
   	&& cp -r /tmp/versions /home/server/server/ \
	&& cp -r /tmp/cache /home/server/server \
	&& cp /tmp/server.jar /home/server/server \
	&& rm -rf /tmp/* 

RUN useradd -ms /bin/bash server
WORKDIR /home/server
COPY . .
RUN chown -hR server /home/server
USER server
EXPOSE 8000

CMD ["bash", "run.sh"]
