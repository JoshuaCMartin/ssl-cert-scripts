If you already have portainer running, you must kill, remove, and redeploy it.
<br><br>
<code>docker kill portainer && docker rm portainer</code>
<br><br>
When originally deploying portainer via docker you can specify and mount the directory the certs are located in on the host machine:
<br>
<code>docker run -d -p 8000:8000 -p 9000:9000 -p 9443:9443 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data -v /path/to/certs:/certs -v /etc/timezone:/etc/timezone:ro -v /etc/localtime:/etc/localtime:ro portainer/portainer-ce:latest --sslcert /certs/fullchain.pem --sslkey /certs/key.pem</code>
<br><br>
From then on, updating certs is as simple as replacing the .pem files and running
<br>
<code>docker restart portainer</code>
<br><br>
Note that in the web interface, despite HTTPS working and enabled, it may look like this, with red X instead of an actual cert location:
<br><br>
![image](https://user-images.githubusercontent.com/51254272/185802284-26eb2514-ee88-41cd-8d8a-677375c10d9a.png)
<br><br>

