# ssl-cert-scripts
A series of scripts and methods used to update SSL Certs on self-hosted services.
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
<li><strong>OpenMediaVault</strong></li>
<li><strong>Unifi Network Application</strong> (Debian LXC)</li>
<li><strong>Jellyfin</strong> (Debian LXC)</li>
<li><strong>AdGuard Home</strong> (Debian LXC)</li>
<li><strong>ProxMox</strong></li>
<li><strong>Portainer</strong> (Debian LXC > Docker)</li>
<li><strong>VaultWarden</strong> (Arch LXC)</li>
<li><strong>NextCloud Pi</strong> (LXC)</li>
<li><strong>NginX Proxy Manager</strong> (Coming Soon)</strong></li>
<br><br>

