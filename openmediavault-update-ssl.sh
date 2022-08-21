#!/bin/bash

# Original sourced from here: https://raw.githubusercontent.com/ryecoaaron/scripts/main/update_cert.sh

# You must first find the UUID(1) of an existing cert for OpenMediaVault.
# Edit the file /etc/openmediavault/config.xml and look for <sslcertificate> and then <uuid>
# UUID will look something like this: 415f7e68-1086-4ccd-b5cd-9e9b8e2df939
# If there isn't one present, this may mean you need to generate a new self-signed SSL certificate within the Web Interface
# under System > Certificates > SSL
# Int he web interface, you then need to select it and enable SSL, under Workbench > [Check] SSL/TLS Enabled, and select your cert.
# The certificate you chose will then be replaced by this script every time.
# If using certs from LetsEncrypt, the cert(2) file should be fullchain.pem, the key(3) file is key.pem
# If Using the OPNSense ACME Plugin to upload via sftp, the default location for the certs is [User-Home-Dir]/[website.com]/[cert-type].pem

# Example
# ./openmediavault-update-ssl.sh 415f7e68-1086-4ccd-b5cd-9e9b8e2df939 /path/to/fullchain.pem /path/to/key.pem


. /usr/share/openmediavault/scripts/helper-functions
. /etc/default/openmediavault

if [[ $(id -u) -ne 0 ]]; then
  echo "This script must be executed as root or using sudo."
  exit 99
fi

uuid="${1}"
cert="${2}"
key="${3}"

if ! omv_isuuid "${uuid}"; then
  echo "Invalid uuid"
  exit 1
fi

if [ ! -f "${cert}" ]; then
  echo "Cert not found"
  exit 2
fi

if [ ! -f "${key}" ]; then
  echo "Key not found"
  exit 3
fi

# if you wanted to copy a cert & key to OMV location, this is how it would be done
#cp -v "${cert}" "${OMV_SSL_CERTIFICATE_DIR}/certs/${OMV_SSL_CERTIFICATE_PREFIX}-${uuid}.crt"
#cp -v "${key}" "${OMV_SSL_CERTIFICATE_DIR}/private/${OMV_SSL_CERTIFICATE_PREFIX}-${uuid}.key"

echo "Cert file :: ${cert}"
echo "Key file :: ${key}"

xpath="/config/system/certificates/sslcertificate[uuid='${uuid}']"
echo "xpath :: ${xpath}"
echo

if ! omv_config_exists "${xpath}"; then
  echo "Config for ${uuid} does not exist"
  exit 4
fi

echo "Updating certificate in database ..."
omv_config_update "${xpath}/certificate" "$(cat ${cert})"

echo "Updating private key in database ..."
omv_config_update "${xpath}/privatekey" "$(cat ${key})"

if [ -n "${4}" ]; then
  echo "Updating comment in database ..."
  omv_config_update "${xpath}/comment" "${4}"
fi

echo "Updating certs and nginx..."
omv-salt deploy run certificates nginx

systemctl restart nginx

exit 0
