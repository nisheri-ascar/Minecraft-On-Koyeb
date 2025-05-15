#!/bin/bash

# Modify each variables if you wish for newer versions
playitVersion=0.15.26
paperServerVersion=1.21.4
paperBuildNumber=229
vvVersion="5.3.2"
vbVersion="5.3.2"
vrVersion="4.0.7"

wget -q https://github.com/playit-cloud/playit-agent/releases/download/v${playitVersion}/playit-linux-amd64 -O bin/playit-binary
chmod 777 bin/playit-binary

# Download Main jar

wget https://piston-data.mojang.com/v1/objects/e6ec2f64e6080b9b5d9b471b291c33cc7f509733/server.jar -O server/server.jar
# Download ViaVersion and its friends

#wget -q https://github.com/ViaVersion/ViaVersion/releases/download/${vvVersion}/ViaVersion-${vvVersion}jar -O server/plugins/ViaVersion.jar

#wget -q https://github.com/ViaVersion/ViaBackwards/releases/download/${vbVersion}/ViaBackwards-${vbVersion}.jar -O server/plugins/ViaBackwards.jar

#wget -q https://github.com/ViaVersion/ViaRewind/releases/download/${vrVersion}/ViaRewind-${vrVersion}.jar -O server/plugins/ViaRewind.jar

# Download Geyser, we don't need versioning of it yet it depends on ViaVersion to work if server is older/newer
wget -q https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot -O server/plugins/Geyser-Spigot.jar


