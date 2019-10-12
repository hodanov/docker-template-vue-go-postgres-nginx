FROM postgres:12-alpine
ENV LANG ja_JP.utf8

ARG POSTGRES_DB
ARG POSTGRES_USER
ARG POSTGRES_PASSWORD
ENV POSTGRES_DB $POSTGRES_DB
ENV POSTGRES_USER $POSTGRES_USER
ENV POSTGRES_PASSWORD $POSTGRES_PASSWORD

WORKDIR /docker-entrypoint-initdb.d

RUN apk --no-cache update \
    && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
