# Docker Minecraft

Read the [blog post](https://medium.com/@tatemz/why-i-love-docker-a-use-case-in-minecraft-b9f2a519d3ce) for a video demonstration on how I use this in Kitematic.

This image is based the Kitematic image, but simply adds the following environment variables:


* `MC_MAX_TICK_TIME` (defaults to `60000`)
* `MC_GENERATOR_SETTINGS` (defaults to empty string)
* `MC_FORCE_GAMEMODE` (defaults to `false`)
* `MC_ALLOW_NETHER` (defaults to `true`)
* `MC_GAMEMODE` (defaults to `0`)
* `MC_ENABLE_QUERY` (defaults to `false`)
* `MC_PLAYER_IDLE_TIMEOUT` (defaults to `0`)
* `MC_DIFFICULTY` (defaults to `2`)
* `MC_SPAWN_MONSTERS` (defaults to `true`)
* `MC_OP_PERMISSION_LEVEL` (defaults to `4`)
* `MC_ANNOUNCE_PLAYER_ACHIEVEMENTS` (defaults to `true`)
* `MC_PVP` (defaults to `true`)
* `MC_SNOOPER_ENABLED` (defaults to `true`)
* `MC_LEVEL_TYPE` (defaults to `DEFAULT`)
* `MC_HARDCORE` (defaults to `false`)
* `MC_ENABLE_COMMAND_BLOCK` (defaults to `false`)
* `MC_MAX_PLAYERS` (defaults to `20`)
* `MC_NETWORK_COMPRESSION_THRESHOLD` (defaults to `256`)
* `MC_RESOURCE_PACK_SHA1` (defaults to empty string)
* `MC_MAX_WORLD_SIZE` (defaults to `29999984`)
* `MC_SERVER_PORT` (defaults to `25565`)
* `MC_SERVER_IP` (defaults to empty string)
* `MC_SPAWN_NPCS` (defaults to `true`)
* `MC_ALLOW_FLIGHT` (defaults to `false`)
* `MC_LEVEL_NAME` (defaults to `world`)
* `MC_VIEW_DISTANCE` (defaults to `10`)
* `MC_RESOURCE_PACK` (defaults to empty string)
* `MC_SPAWN_ANIMALS` (defaults to `true`)
* `MC_WHITE_LIST` (defaults to `false`)
* `MC_GENERATE_STRUCTURES` (defaults to `true`)
* `MC_ONLINE_MODE` (defaults to `true`)
* `MC_MAX_BUILD_HEIGHT` (defaults to `256`)
* `MC_LEVEL_SEED` (defaults to empty string)
* `MC_USE_NATIVE_TRANSPORT` (defaults to `true`)
* `MC_ENABLE_RCON` (defaults to `false`)
* `MC_MOTD` (defaults to `A Minecraft Server`)


## Getting Started

```
$ docker run -p 25565:25565 -d --name="minecraft" -e "MC_DIFFICULTY=2" -e "MC_HARDCORE=true" tatemz/minecraft
```
