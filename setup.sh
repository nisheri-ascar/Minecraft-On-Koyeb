#!/bin/bash

paperServerVersion="1.21.4"
paperBuildNumber=299
vvVersion="5.3.2"
vbVersion="5.3.2"
vrVersion="4.0.7"


# Download Main plugin
wget -q https://api.papermc.io/v2/projects/paper/versions/${paperServerVersion}/builds/${paperBuildNumber}/downloads/paper-${paperServerVersion}-${paperBuildNumber}.jar -O server/server.jar

# Download ViaVersion and its friends

wget -q https://github.com/ViaVersion/ViaVersion/releases/download/${vvVersion}/ViaVersion-${vvVersion}jar -O server/plugins/ViaVersion.jar

wget -q https://github.com/ViaVersion/ViaBackwards/releases/download/${vbVersion}/ViaBackwards-${vbVersion}.jar -O server/plugins/ViaBackwards.jar

wget -q https://github.com/ViaVersion/ViaRewind/releases/download/${vrVersion}/ViaRewind-${vrVersion}.jar -O server/plugins/ViaRewind.jar

# Download Geyser, we don't need versioning of it yet it depends on ViaVersion to work if server is older/newer
wget -q https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot -O server/Geyser-Spigot.jar


