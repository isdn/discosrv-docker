The docker files for the discovery service (the Syncthing project - https://github.com/syncthing).

The files are for v0.12 protocol.

The certificate files (cert.pem and cert.key) should be placed along with the files here.
To build the image:

```
docker build -f Dockerfile -t discosrv:0.12 .
```

To run it:

```
docker run -p 8443:8443 -ti --name discosrv discosrv:0.12
```

Then, you can set up this container as a systemd service (and enable its autostart). Put `discosrv.service` into `/etc/systemd/system/`. Then run these commands as root to enable the service:

```
systemctl enable discosrv
systemctl enable docker
```

To check the service status run:

```
systemctl status discosrv
```

