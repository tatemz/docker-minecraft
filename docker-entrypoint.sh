#!/bin/bash
set -e

if [[ "$1" == mc-server ]]; then
  sed_escape_lhs() {
    echo "$@" | sed 's/[]\/$*.^|[]/\\&/g'
  }

  sed_escape_rhs() {
    echo "$@" | sed 's/[\/&]/\\&/g'
  }

  set_config() {
    key="$1"
    value="$2"
    start="$(sed_escape_lhs "$key")\="
    end="\s*"
    sed -ri "s/($start\s*).*($end)$/\1$(sed_escape_rhs "$value")\2/" /data/server.properties
  }
  
  if ! [ -e /data/server.properties ]; then
    cat > /data/server.properties <<EOL
#Minecraft server properties
#Wed Aug 10 06:27:17 UTC 2016
max-tick-time=60000
generator-settings=
force-gamemode=0
allow-nether=true
gamemode=0
enable-query=false
player-idle-timeout=0
difficulty=2
spawn-monsters=true
op-permission-level=4
announce-player-achievements=true
pvp=true
snooper-enabled=true
level-type=DEFAULT
hardcore=false
enable-command-block=false
max-players=20
network-compression-threshold=256
resource-pack-sha1=
max-world-size=29999984
server-port=25565
server-ip=
spawn-npcs=true
allow-flight=false
level-name=world
view-distance=10
resource-pack=
spawn-animals=true
white-list=false
generate-structures=true
online-mode=true
max-build-height=256
level-seed=
use-native-transport=true
enable-rcon=false
motd=A
EOL
  fi


  if [ -e /data/server.properties ]; then
    set_config 'max-tick-time' $MC_MAX_TICK_TIME
    set_config 'generator-settings' $MC_GENERATOR_SETTINGS
    set_config 'force-gamemode' $MC_FORCE_GAMEMODE
    set_config 'allow-nether' $MC_ALLOW_NETHER
    set_config 'gamemode' $MC_GAMEMODE
    set_config 'enable-query' $MC_ENABLE_QUERY
    set_config 'player-idle-timeout' $MC_PLAYER_IDLE_TIMEOUT
    set_config 'difficulty' $MC_DIFFICULTY
    set_config 'spawn-monsters' $MC_SPAWN_MONSTERS
    set_config 'op-permission-level' $MC_OP_PERMISSION_LEVEL
    set_config 'announce-player-achievements' $MC_ANNOUNCE_PLAYER_ACHIEVEMENTS
    set_config 'pvp' $MC_PVP
    set_config 'snooper-enabled' $MC_SNOOPER_ENABLED
    set_config 'level-type' $MC_LEVEL_TYPE
    set_config 'hardcore' $MC_HARDCORE
    set_config 'enable-command-block' $MC_ENABLE_COMMAND_BLOCK
    set_config 'max-players' $MC_MAX_PLAYERS
    set_config 'network-compression-threshold' $MC_NETWORK_COMPRESSION_THRESHOLD
    set_config 'resource-pack-sha1' $MC_RESOURCE_PACK_SHA1
    set_config 'max-world-size' $MC_MAX_WORLD_SIZE
    set_config 'server-port' $MC_SERVER_PORT
    set_config 'server-ip' $MC_SERVER_IP
    set_config 'spawn-npcs' $MC_SPAWN_NPCS
    set_config 'allow-flight' $MC_ALLOW_FLIGHT
    set_config 'level-name' $MC_LEVEL_NAME
    set_config 'view-distance' $MC_VIEW_DISTANCE
    set_config 'resource-pack' $MC_RESOURCE_PACK
    set_config 'spawn-animals' $MC_SPAWN_ANIMALS
    set_config 'white-list' $MC_WHITE_LIST
    set_config 'generate-structures' $MC_GENERATE_STRUCTURES
    set_config 'online-mode' $MC_ONLINE_MODE
    set_config 'max-build-height' $MC_MAX_BUILD_HEIGHT
    set_config 'level-seed' $MC_LEVEL_SEED
    set_config 'use-native-transport' $MC_USE_NATIVE_TRANSPORT
    set_config 'enable-rcon' $MC_ENABLE_RCON
    set_config 'motd' $MC_MOTD
  fi

  echo eula=true > /data/eula.txt && java -jar /minecraft_server.1.10.2.jar
else
  exec "$@"
fi

