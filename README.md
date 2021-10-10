# Empyrion - Galactic Survival

Empyrion - Galactic Survival is a 3D open world, space survival adventure in which you can fly across space and land on planets. Build, explore, fight and survive in a hostile galaxy full of hidden dangers.

## Known Issues
- Console currently only displays logs from a log file, commands entered in the console will not be excecuted. Use the telnet server to issue server commands.
- Because of the above the server will not stop gracefully when using the stop or restart commands. The server must be killed after gracefully shutting down the server using telnet.

## Recommended server settings
### Minimum Specifications
- At least 7168M RAM plus 1024M per playfield above 3. This is just a guideline, more is better.
- Minimum 10GB hard disk space to install.

See the following - https://empyrion.gamepedia.com/Dedicated_Server_Setup

### Server Ports
Ports required to run the server.
Requires all 4 game ports in the range.
Do not expose the telnet port to the internet.

| Port  | default |
|-------|---------|
| Game  | 30000-30004   |
| Telnet |  30004  | 

#### Credits
https://git.phenomic.net/PHENOM/Pterodactyl-Egg-Empyrion/ for the initial egg.

https://github.com/acl1704/pterodactyl-empyrion for modifying egg to use standard pterodactyl images
