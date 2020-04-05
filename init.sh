#!/bin/bash

if [ ! -d /data/Stardew ]; then

  echo "Unpacking"
  unzip /data/stardew_valley_*.sh -d /data/Stardew

fi

if [ ! -f /data/nexus.zip ]; then 
  echo "Downloading Modloader"
  wget https://github.com/Pathoschild/SMAPI/releases/download/3.4.1/SMAPI-3.4.1-installer.zip -qO /data/nexus.zip

  echo "Unpacking Modloader"
  mkdir -p /data/nexus
  unzip /data/nexus.zip -d /data/nexus/

  echo "Installing Modloader"
  /bin/bash -c "echo -e \"2\n/data/Stardew/data/noarch/game\n1\n\" | /usr/bin/mono /data/nexus/SMAPI\ 3.4.1\ installer/internal/unix-install.exe"
fi

if [ ! -d /data/Stardew/data/noarch/game/Mods/AutoLoadGame ]; then
  echo "Extracting"
  unzip /data/mods.zip -d /data/Stardew/data/noarch/game/Mods
fi

apt-get install -y xterm i3

Xvfb :10 -screen 0 1000x1000x24 -ac &
export DISPLAY=:10.0
x11vnc -passwd $VNCPASS -display :10 -forever -shared -loop &
sleep 10
i3 &

TERM=xterm
/data/Stardew/data/noarch/game/StardewValley
