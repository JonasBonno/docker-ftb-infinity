#!/bin/bash


MINECRAFT_HOME="/opt/minecraft"
FTB_INFINITY_URL="http://addons-origin.cursecdn.com/files/2292/903/FTBInfinityEvolvedServer_2.5.0.zip"
LAUNCHWRAPPER="net/minecraft/launchwrapper/1.12/launchwrapper-1.12.jar"
MINECRAFT_OPTS="-server -Xms512M -Xmx2048M -XX:+CMSIncrementalPacing -XX:+CMSClassUnloadingEnabled -XX:ParallelGCThreads=2 -XX:MinHeapFreeRatio=5 -XX:MaxHeapFreeRatio=10 -XX:+PrintGCDetails"
MINECRAFT_STARTUP_JAR="$MINECRAFT_HOME/FTBServer-1.7.10-1614.jar"
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
op-permission-level=4
allow-nether=true
level-name=world
enable-query=false
allow-flight=false
announce-player-achievements=true
server-port=25565
level-type=DEFAULT
enable-rcon=false
level-seed=
force-gamemode=false
server-ip=
max-build-height=256
spawn-npcs=true
white-list=false
spawn-animals=true
hardcore=false
snooper-enabled=true
online-mode=true
resource-pack=
pvp=true
difficulty=1
enable-command-block=false
gamemode=0
player-idle-timeout=0
max-players=20
spawn-monsters=true
generate-structures=true
view-distance=10
motd=FTB Infinity Evolved
EOL
chmod +x $MINECRAFT_HOME/FTBInstall.sh $MINECRAFT_HOME/ServerStart.sh
else
	echo "=> Using existing Minecraft"
fi


# Start FTB
./$MINECRAFT_HOME/ServerStart.sh
