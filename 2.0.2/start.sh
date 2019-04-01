#!/bin/bash


MINECRAFT_HOME="/opt/minecraft"
FTB_INFINITY_URL="http://addons-origin.cursecdn.com/files/2264/805/FTBInfinityServer.zip"
LAUNCHWRAPPER="net/minecraft/launchwrapper/1.11/launchwrapper-1.11.jar"
MINECRAFT_OPTS="-server -Xms2048m -Xmx3072m -XX:MaxPermSize=256m -XX:+UseParNewGC -XX:+UseConcMarkSweepGC"
MINECRAFT_STARTUP_JAR="$MINECRAFT_HOME/FTBServer-1.7.10-1448.jar"
MCVER="1.7.10"
JARFILE="minecraft_server.${MCVER}.jar"


if [[ ! -d $MINECRAFT_HOME/libraries ]]; then
    	echo "=> Minecraft not found!"
	echo "=> Downloading new Minecraft..."
	curl -S $FTB_INFINITY_URL -o /tmp/infinity.zip
	rm -Rf $MINECRAFT_HOME/* && unzip /tmp/infinity.zip -d $MINECRAFT_HOME && rm /tmp/infinity.zip
	mkdir -p $MINECRAFT_HOME/libraries && curl -S https://libraries.minecraft.net/$LAUNCHWRAPPER -o $MINECRAFT_HOME/libraries/$LAUNCHWRAPPER
	find $MINECRAFT_HOME -name "*.log" -exec rm -f {} \; && rm -rf $MINECRAFT_HOME/ops.* $MINECRAFT_HOME/whitelist.* $MINECRAFT_HOME/logs/* /tmp/*
	curl -S https://s3.amazonaws.com/Minecraft.Download/versions/${MCVER}/minecraft_server.${MCVER}.jar -o $MINECRAFT_HOME/${JARFILE}
	cat >$MINECRAFT_HOME/eula.txt <<EOL
eula=true
EOL
	cat >$MINECRAFT_HOME/server.properties <<EOL
#Minecraft server properties
generator-settings=
allow-nether=true
level-name=world
enable-query=false
allow-flight=false
server-port=25565
level-type=BIOMESOP 
enable-rcon=false
level-seed=
force-gamemode=false
server-ip=
max-build-height=256
spawn-npcs=true
white-list=false
spawn-animals=true
snooper-enabled=true
texture-pack=true
online-mode=true
pvp=true
difficulty=1
gamemode=0
max-players=20
spawn-monsters=true
generate-structures=true
view-distance=10
motd=A minecraft server
EOL
chmod +x $MINECRAFT_HOME/FTBInstall.sh $MINECRAFT_HOME/ServerStart.sh
else
	echo "=> Using existing Minecraft"
fi


# Start FTB
./$MINECRAFT_HOME/ServerStart.sh
