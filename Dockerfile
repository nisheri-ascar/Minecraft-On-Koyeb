# Dockerfile
FROM archlinux:latest

RUN yes | pacman -Syu vim darkhttpd wget 

#RUN wget -q https://download.oracle.com/graalvm/21/latest/graalvm-jdk-21_linux-x64_bin.tar.gz -O /tmp/archive.tar.gz \
#	&& mkdir -p /opt \
#	&& tar -vxzf /tmp/archive.tar.gz -C /opt \
#	&& ln -s /opt/graalvm-jdk-21.0.7+8.1/bin/java /bin/java

# JRE 21, for viaproxy
RUN wget https://github.com/ibmruntimes/semeru21-certified-binaries/releases/download/jdk-21.0.7%2B6_openj9-0.51.0/ibm-semeru-certified-jre_x64_linux_21.0.7.0.tar.gz -O /tmp/j9.tar.gz \
    && mkdir -p /opt \
    && tar -xzf /tmp/j9.tar.gz -C /opt \
    && ln -s /opt/jdk-21.0.7+6-jre/bin/java /bin/j9-java21 \
    && rm /tmp/j9.tar.gz

# JRE 8, for minecraft
RUN wget https://github.com/ibmruntimes/semeru8-binaries/releases/download/jdk8u452-b09_openj9-0.51.0/ibm-semeru-open-jre_x64_linux_8u452b09_openj9-0.51.0.tar.gz -O /tmp/j9.tar.gz \
    && mkdir -p /opt \
    && tar -xzf /tmp/j9.tar.gz -C /opt \
    && ln -s /opt/jdk8u452-b09-jre/bin/java /bin/j9-java8 \
    && rm /tmp/j9.tar.gz

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
#really small swap just to keep things alive
RUN dd if=/dev/zero of=/swapfile bs=1M count=128 \
    && chmod 600 /swapfile \
    && mkswap /swapfile \
    && swapon /swapfile 

RUN useradd -ms /bin/bash server
WORKDIR /home/server
COPY . .
RUN chown -hR server /home/server
USER server
EXPOSE 8000

CMD ["bash", "run.sh"]
