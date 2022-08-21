# ssl-cert-scripts
A series of scripts used to update SSL Certs on self-hosted services.

I have a number of self-hosted services, and while reverse proxies like nginx are incredibly useful, they can cause issues.

There are a few services for which I found it was easier to update the cert within the service itself.

Some are as easy as uploading the new cert via SFTP and restarting a service.

Others are more involved. These are the scripts I use. You are welcome to use them for any and all purposes.
