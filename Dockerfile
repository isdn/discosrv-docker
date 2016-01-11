FROM alpine:latest

RUN apk -U add curl supervisor && rm -rf /var/cache/apk/*

RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN curl -sSL http://build.syncthing.net/job/discosrv/lastSuccessfulBuild/artifact/discosrv-linux-amd64.tar.gz \
    | tar -v -C /usr/local -xz

EXPOSE 8443

RUN addgroup discosrv && adduser -S -D -h /home/discosrv -G discosrv discosrv

COPY cert.pem cert.key /home/discosrv/

VOLUME /home/discosrv

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
