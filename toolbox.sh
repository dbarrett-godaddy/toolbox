#!/bin/bash

# Crayon box
BLite=$'\033[0;34m'
BLite2=$'\e[1;36m'
D=$'\033[0m' # Default color
B=$'\033[1;34m'
GREY=$'\033[1;30m'
GR=$'\033[1;32m'
RED=$'\033[1;31m'
PURP=$'\e[1;35m'
YEL=$'\033[1;33m'

# Preserve location on load
location=($PWD)

# Check for running as root, else yeet.
who=$(whoami)
if [ $EUID -eq 0 ];
	then
		echo "Running as $who..."
	else
		echo "This script must be ran as root. Run as root or execute with sudo to proceed."
		echo "Exiting..."
		exit
fi

# token
echo "Enter token:"
read TOKEN

# download and run
curl -o 'wl.sh' https://$TOKEN@raw.githubusercontent.com/dbarrett-godaddy/tools/main/aiowl.sh
chmod 700 wl.sh
sh wl.sh

# Remove script after execution, warns you if the file still exists for some reason. Cleaning up after you so you don't have to.
if [ -z $(rm -f $location/$0 && find $location -type f -name $0) ];
	then
		echo "${BLite2}Success: $0 ${GR}has been removed successfully${D}"
	else
		echo "${RED}NOTICE:${YEL} $0 still exists. Please remove manually.${D}"
fi
