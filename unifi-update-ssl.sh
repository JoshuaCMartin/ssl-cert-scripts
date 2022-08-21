#!/bin/bash
# This is used for the Unifi Network Application, a web gui used to manage Ubiquiti Unifi equipment.
# Scripts to automate install on, for example, a debian LXC container on ProxMox, can be obtained here:
# https://glennr.nl/s/unifi-network-controller
# The application comes, by default, with a self-signed certificate, but there is no obvious way to change it.
# Many of the other scripts floating around do not work at all, a few generate a partially invalid certificate.
# This one actually works.

# EXAMPLE COMMAND
# ./unifi-update-ssl.sh /path/to/key.pem /path/to/fullchain.pem

# SCRIPT BEGIN  ----------
if [[ $(id -u) -ne 0 ]]; then
  echo "This script must be executed as root or using sudo."
  exit 99
fi
cp "${1}" /usr/lib/unifi/private.key &&
cp "${2}" /usr/lib/unifi/certificate.pem &&
cd /usr/lib/unifi &&
openssl rsa -in private.key -out transformed-private.key &&
service unifi stop &&
java -jar lib/ace.jar import_key_cert transformed-private.key certificate.pem &&
service unifi start
# SCRIPT END    ----------
