#!/bin/bash

# Call this script with the paths to your cert.pem(1) and key.pem(2) files from LetsEncrypt and finally the output cert.pfx(3)
# The generated SSL certificate can be sent anywhere, as long as the user jellyfin has permissions to read that directory. I use /var/lib/jellyfin.
# If using OPNSense ACME Plugin to upload, they will by default be in [User Home Dir]/[site-name].com/[cert-type].pem
# After generating a pfx cert file, you must select the file as your cert in the Jellyfin Web Interface, under Dashboard > Networking > Custom SSL certificate path:
# Selecting the cert in the web GUI only need be done once, but the service must be restarted every time the cert is updated.
# passout pass: leaves the password for the exported key empty. 
# Simply change to -passout pass: [Your Password] and enter it in the Jellyfin Web Interface if you'd like


# Example:
# ./jellyfin-update-ssl.sh /root/example.com/cert.pem /root/example.com/key.pem /var/lib/jellyfin/cert.pfx


# SCRIPT BEGIN  ----------
cert="${1}"
key="${2}"
jellycert="${3}"

openssl pkcs12 -export -in "${cert}" -inkey "${key}" -out "${jellycert}" -passout pass:
chown jellyfin:jellyfin "${jellycert}"
systemctl restart jellyfin
# SCRIPT END    ----------
