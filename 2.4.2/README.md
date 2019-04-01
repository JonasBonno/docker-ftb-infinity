# ftb-infinity - v2.4.2
Feed The Beast Infinity Evolved modpack
made by Feed The Beast at https://feed-the-beast.com

Modpack for Minecraft 1.7.10.
Infinity Evolved is the general all-purpose pack from the FTB team that is designed for solo play as well as small and medium population servers. The pack for all people.
Fastcraft is enabled in this pack by default.

<img src="http://media-elerium.cursecdn.com/avatars/27/883/635818079923323584.png" width="338" height="338">

NOTE: In compliance with Mojang "End User License Agreement", you will need to agree to the EULA in order to run your own Minecraft server. By using this container you acknowledge the EULA! If you do not agree, then you are not permitted to use this container!

Running ftb-infinity:
docker run -d -p 25565:25565 -v [path to data location on host]:/opt/minecraft jonasbonno/ftb-infinity:2.4.2

To access the console:
</br>docker attach [name of container]
</br>Run for commands
</br>To exit again press CTRL+P and then CTRL+Q

I personaly use:
docker run --tty=true --interactive=true --detach=true --name=CONTAINERNAME --publish=25565:25565 --volume=[path to data location on host]:/opt/minecraft jonasbonno/ftb-infinity:2.4.2

The first time the server starts it creates the server.properties file with default settings and spawns "world". 
Feel free to modify to your preferences. 

To change the server.properties file:
- Stop the container.
- Modify server.properties in your directory. Use sudo if permission errors.
- If you changed the servername. Delete "world" folder to save some diskspace.

When upgrading:
- Move your "world" folder, server.properties, and e.g. also whitelist.json, ops.json etc to a secure location.
- Delete everthing in [path to data location on host].
- Create new container and let it startup completely the first time.
- Turn it off and copy your folder and files back.
