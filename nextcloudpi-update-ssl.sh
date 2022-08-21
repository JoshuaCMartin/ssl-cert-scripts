#!/bin/bash
# This is a relatively easy one, we simply replace the default self-signed certs and restart apache.

# EXAMPLE
# ./nextcloudpi-update-ssl.sh /path/to/fullchain.pem /path/to/key.pem

# SCRIPT BEGIN  ----------
if [[ $(id -u) -ne 0 ]]; then
  echo "This script must be executed as root or using sudo."
  exit 99
fi
cp "${1}" /etc/ssl/certs/ssl-cert-snakeoil.pem &&
cp "${2}" /etc/ssl/private/ssl-cert-snakeoil.key &&
systemctl restart apache2
# SCRIPT END    ----------
