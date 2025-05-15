#!/bin/bash

defaultPaperServerVersion="1.21.5"
defaultPaperBuildNumber=229

if [[ -z paperBuildNumber ]]; then
    paperBuildNumber=$defaultPaperBuildNumber
fi

if [[ -z paperServerVersion ]]; then
  paperServerVersion=$defaultPaperServerVersion
fi

wget -q https://api.papermc.io/v2/projects/paper/versions/${paperServerVersion}/builds/${paperBuildNumber}/downloads/paper-${paperServerVersion}-${paperBuildNumber}.jar -O server.jar


