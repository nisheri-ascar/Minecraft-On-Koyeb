# Dockerfile
FROM archlinux:latest

RUN yes | pacman -Syu vim darkhttpd wget 

#RUN wget -q https://download.oracle.com/graalvm/21/latest/graalvm-jdk-21_linux-x64_bin.tar.gz -O /tmp/archive.tar.gz \
#	&& mkdir -p /opt \
#	&& tar -vxzf /tmp/archive.tar.gz -C /opt \
#	&& ln -s /opt/graalvm-jdk-21.0.7+8.1/bin/java /bin/java


RUN wget -q https://download.oracle.com/graalvm/21/latest/graalvm-jdk-21_linux-x64_bin.tar.gz -O /tmp/archive.tar.gz \
       && mkdir -p /opt \
       && tar -vxzf /tmp/archive.tar.gz -C /opt \
       && ln -s /opt/graalvm-jdk-21.0.7+8.1/bin/java /bin/java



#WORKDIR /tmp
#RUN export paperServerVersion=1.13.2 \
#	&& export paperBuildNumber=655 \
#	&& echo "Patching jar" \
 #	&& wget -q https://api.papermc.io/v2/projects/paper/versions/${paperServerVersion}/builds/${paperBuildNumber}/downloads/paper-${paperServerVersion}-${paperBuildNumber}.jar -O /tmp/server.jar \
 # 	&& java -DPaper.IgnoreJavaWarning=true -jar server.jar & sleep 50; pkill java \
#	&& mkdir -p /home/server/server \
#   	&& cp -r versions/ /home/server/server/ \
#	&& cp -r cache /home/server/server \
#	&& cp server.jar /home/server/server \
#	&& rm -rf /tmp/* 
# above applied shitty workaround for paper below 1.19, doesnt support --initSettings option
# TODO: EULA_BOOLEAN

RUN useradd -ms /bin/bash server
WORKDIR /home/server
COPY . .
RUN chown -hR server /home/server
USER server
EXPOSE 8000

CMD ["bash", "run.sh"]
