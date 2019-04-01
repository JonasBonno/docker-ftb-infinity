# ftb-infinity - v1.10.1
Feed The Beast Infinity modpack
made by Feed The Beast at https://feed-the-beast.com

Modpack for Minecraft 1.7.10.
Infinity is the general all-purpose pack from the FTB team that is designed for solo play as well as small and medium population servers. The pack for all people.
Fastcraft is enabled in this pack by default.

<img src="http://ftbwiki.org/images/thumb/0/04/Logo_FTB_Infinity.jpg/600px-Logo_FTB_Infinity.jpg" width="300" height="300">

NOTE: In compliance with Mojang "End User License Agreement", you will need to agree to the EULA in order to run your own Minecraft server. By using this container you acknowledge the EULA! If you do not agree, then you are not permitted to use this container!

Running ftb-infinity:
docker run -d -p 25565:25565 -v [path to data location on host]:/opt/minecraft jonasbonno/ftb-infinity:1.10.1

The first time the server starts it creates the server.properties file with default settings and spawns "world". 
Feel free to modify to your preferences. 

To change the server.properties file:
- Stop the container.
- Modify server.properties in your directory. Use sudo if permission errors.
- If you changed the servername. Delete "world" folder to save some diskspace.
