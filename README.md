This is the docker files of the discovery service for the Syncthing project - https://github.com/syncthing.

The files are for v0.11 protocol.

To build the image:

```
docker build -f Dockerfile.supervisor -t syncthing/discosrv .
```

To run it:

```
docker run -p 22026:22026/udp -ti --name discosrv syncthing/discosrv
```

Then, you can set up this container as a systemd service (and enable its autostart). Put `discosrv.service` into `/etc/systemd/system/`. Then run these commands as root to enable the service:

```
systemctl enable discosrv
systemctl enable docker
``

To check the service status run:

```
systemctl status discosrv
```

