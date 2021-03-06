#!/bin/bash
# Minecraft Server Permissions Fix Script - James A. Chambers - https://jamesachambers.com/minecraft-bedrock-edition-ubuntu-dedicated-server-guide/

# Takes ownership of server files to fix common permission errors such as access denied
# This is very common when restoring backups, moving and editing files, etc.

# If you are using the systemd service (sudo systemctl start servername) it performs this automatically for you each startup

echo "Taking ownership of all server files/folders in dirname/minecraftbe/servername"
sudo chown -Rv userxname dirname/minecraftbe/servername
sudo chmod -R 755 dirname/minecraftbe/servername/*.sh
sudo chmod 755 dirname/minecraftbe/servername/bedrock_server
sudo chmod +x dirname/minecraftbe/servername/bedrock_server

NewestLog=$(find dirname/minecraftbe/servername/logs -type f -exec stat -c "%y %n" {} + | sort -r | head -n1 | cut -d " " -f 4-)
echo "Displaying last 5 lines from log file $NewestLog in /logs folder:"
tail -5 "$NewestLog"

echo "Complete"