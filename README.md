# Stardew Valley Multiplayer Docker Compose

This project aims to autostart a Stardew Valley Multiplayer Server as easy as possible.

## Setup

### Docker-Compose

Change VNCPASS in `docker-compose.yml` with a strong password

```
git clone https://github.com/printfuck/stardew-multiplayer-docker
cd stardew-multiplayer-docker
```

Place your save folder in `data/valley_saves/` if you have one, or create a new game later using a VNC client to access the server game instance.

```
docker-compose up
```

### Ansible

Create an inventory file with your hosts

```
ansible -i <your_inventori> playbook.yml
```

### Terraform (with Hetzner Cloud)

Enter your API Token in `terraform/vars.auto.tfvars` and run the following script:

```
./terra.sh
```

## Game Setup

Intially you have to create or load a game once after first startup. After that the Autoload Mod jump starts into the previously loaded savegame everytime you rerun the container. You can also edit the config file of the Autoload Mod to archieve similar behaviour.

## Mods already packed

- Always On Server
- AutoLoadGame
- MoreMultiplayerInfo
- MPSpeechBubbles
- UnlimitedPlayers

Some mods are unofficial forks compatibile with the 1.4 version of the game.

## Launch your server

1. Clone this repository on your server
```
git clone https://github.com/printfuck/stardew-multiplayer-docker
cd stardew-multiplayer-docker
```
1. Put your Linux GOG game `.sh` installer file in `data` folder of this repository, do not change the original name `stardew_valley_*.sh`
1. Change `VNCPASS` env variable in `docker-compose.yml` with a strong password
1. Execute `docker-compose up` in this project root directory
1. Afterwards everything will be unpacked into the right places. In the end of the init script the game will be started inside Xvfb.
1. Access your game server instance using a VNC server pointing to your server IP on port 5902
1. Load your save selecting `Co-Op -> Host -> Your save`, or create a new one in the same sub menu `Co-Op -> Host -> Host new farm...`

## Why Docker

This should be simple and easily deployable, so there are only a few options.
