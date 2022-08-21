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
<li><strong>Unifi Network Application(Debian LXC)</strong></li>
<li><strong>Jellyfin(Debian LXC)</strong></li>
<li><strong>AdGuard Home(Debian LXC)</strong></li>
<li><strong>ProxMox</strong></li>
<li><strong>VaultWarden(Arch LXC)</strong></li>
<li><strong>NextCloud Pi(LXC)</strong></li>
<li><strong>NginX Proxy Manager (Coming Soon)</strong></li>
<br><br>

