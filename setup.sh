#!/bin/bash

# Modify each variables if you wish for newer versions
playitVersion=0.15.26
paperServerVersion=1.21.4
paperBuildNumber=230
vvVersion="5.3.2"
vbVersion="5.3.2"
vrVersion="4.0.7"

wget -q https://github.com/playit-cloud/playit-agent/releases/download/v${playitVersion}/playit-linux-amd64 -O bin/playit-binary
chmod 777 bin/playit-binary

# Download Main jar
# wget -q https://api.papermc.io/v2/projects/paper/versions/${paperServerVersion}/builds/${paperBuildNumber}/downloads/paper-${paperServerVersion}-${paperBuildNumber}.jar -O server/server.jar
#wget -q https://downloads.hpfxd.com/v2/projects/pandaspigot/versions/1.8.8/builds/latest/downloads/paperclip -O server/server.jar
wget https://piston-data.mojang.com/v1/objects/b58b2ceb36e01bcd8dbf49c8fb66c55a9f0676cd/server.jar -O server/server.jar


# Download ViaVersion and its friends

#wget -q https://github.com/ViaVersion/ViaVersion/releases/download/${vvVersion}/ViaVersion-${vvVersion}jar -O server/plugins/ViaVersion.jar

#wget -q https://github.com/ViaVersion/ViaBackwards/releases/download/${vbVersion}/ViaBackwards-${vbVersion}.jar -O server/plugins/ViaBackwards.jar

#wget -q https://github.com/ViaVersion/ViaRewind/releases/download/${vrVersion}/ViaRewind-${vrVersion}.jar -O server/plugins/ViaRewind.jar

wget -q https://github.com/ViaVersion/ViaProxy/releases/download/v3.4.1/ViaProxy-3.4.1.jar -O viaproxy/ViaProxy.jar

# Download Geyser, we don't need versioning of it yet it depends on ViaVersion to work if server is older/newer
wget -q https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/viaproxy -O viaproxy/plugins/Geyser-ViaProxy.jar

#./setup-j9.sh
