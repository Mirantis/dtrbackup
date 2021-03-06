FROM alpine
ENV DOCKERVERSION=19.03.1

RUN apk update && apk upgrade && apk add bash curl jq coreutils
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz \
  && tar xzvf docker-${DOCKERVERSION}.tgz --strip 1 \
                 -C /usr/local/bin docker/docker \
  && rm docker-${DOCKERVERSION}.tgz

COPY backup_dtr.sh /.
RUN chmod +x /backup_dtr.sh

CMD ["/backup_dtr.sh"]

VOLUME /backup
