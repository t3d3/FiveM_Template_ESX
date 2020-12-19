FROM alpine:latest

RUN apk add --no-cache ca-certificates curl
RUN curl https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/3184-6123f9196eb8cd2a987a1dd7ff7b36907a787962/fx.tar.xz | tar xJ -C /srv

WORKDIR /srv

EXPOSE 30120/tcp 30120/udp

ENTRYPOINT ["sh", "/srv/run.sh"]
CMD ["+exec", "/srv/server.cfg"]
