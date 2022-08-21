#!/bin/bash
# My configuration is a bit unusual, in that I am running VaultWarden on an Arch LXC on Proxmox, installed from the AUR
# YMMV on other systems/configs

# First /etc/vaultwarden.env needs to be edited.
# Find the line marked ROCKET_TLS, uncomment it, and change it to look like so:
# ROCKET_TLS={certs="/usr/share/webapps/vaultwarden-web/cert/fullchain.pem",key="/usr/share/webapps/vaultwarden-web/cert/key.pem"}
# Make sure these two are set and uncommented as well:
# ROCKET_ADDRESS=0.0.0.0
# ROCKET_PORT=443

# Now pass the locations of your fullchain.pem and key.pem files as arguments to this script
# EXAMPLE
# ./vaultwarden-update-ssl /path/to/fullchain.pem /path/to/key.pem

# SCRIPT BEGIN  ----------
if [[ $(id -u) -ne 0 ]]; then
  echo "This script must be executed as root or using sudo."
  exit 99
fi

mkdir /usr/share/webapps/vaultwarden-web/cert/
cp "${1}" /usr/share/webapps/vaultwarden-web/cert/fullchain.pem &&
cp "${2}" /usr/share/webapps/vaultwarden-web/cert/key.pem &&
chown -R vaultwarden:vaultwarden /usr/share/webapps/vaultwarden-web/cert/ &&
systemctl restart vaultwarden
# SCRIPT END  ----------
