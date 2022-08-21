# ssl-cert-scripts
A series of scripts and methods used to update SSL Certs on <strong>self-hosted services.</strong>
<br>
I have a number of self-hosted services, and while reverse proxies like nginx are incredibly useful, they can cause issues.
<br>
Furthermore, I much prefer to create a single wildcard cert using the ACME plugin within OPNSense, and use it for all my internal services
as opposed to generating (and managing updates for) a new cert for each of the dozens of hosts on my network.
<br>
There are a few services for which I found it was easier to update the cert within the service itself.
<br>
Some are as easy as uploading the new cert via SFTP and restarting a service.
<br>
Others are more involved. These are the scripts and methods I use. You are welcome to use them for any and all purposes.
<br>
<li><a href="openmediavault-update-ssl.sh"><strong>OpenMediaVault</strong> (Script)</a></li>
<li><a href="unifi-update-ssl.sh"><strong>Unifi Network Application</strong> (Script)</a></li>
<li><a href="jellyfin-update-ssl.sh"><strong>Jellyfin</strong> (Script)</a></li>
<li><a href="adguard-home-update-ssl.md"><strong>AdGuard Home</strong> (Readme)</a></li>
<li><a href="proxmox-update-ssl.sh"><strong>ProxMox</strong> (Script)</li>
<li><a href="portainer-update-ssl.md"><strong>Portainer</strong> (Readme)</a></li>
<li><a href="vaultwarden-update-ssl.sh"><strong>VaultWarden</strong> (Script)</a></li>
<li><a href="nextcloudpi-update-ssl.sh"><strong>NextCloud Pi</strong> (Script)</a></li>
<li><strong>NginX Proxy Manager</strong> (Coming Soon)</strong></li>
<br><br>

