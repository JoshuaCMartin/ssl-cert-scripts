#!/bin/bash

# EXAMPLE
# ./proxmox-update-ssl.sh /path/to/fullchain.pem /path/to/key.pem node-name

# SCRIPT BEGIN  ----------
if [[ $(id -u) -ne 0 ]]; then
  echo "This script must be executed as root or using sudo."
  exit 99
fi
chown www-data:www-data "${1}" &&
chown www-data:www-data "${2}" &&
cp "${1}" /etc/pve/nodes/"${3}"/pveproxy-ssl.pem &&
cp "${2}" /etc/pve/nodes/"${3}"/pveproxy-ssl.key &&
systemctl restart pveproxy
# SCRIPT END    ----------
