FROM golang:1.13-alpine
ENV LANG='ja_JP.utf8'
ENV GO111MODULE='on'

ARG POSTGRES_DB
ARG POSTGRES_USER
ARG POSTGRES_PASSWORD
ARG POSTGRES_PORT
ENV POSTGRES_DB $POSTGRES_DB
ENV POSTGRES_USER $POSTGRES_USER
ENV POSTGRES_PASSWORD $POSTGRES_PASSWORD
ENV POSTGRES_PORT $POSTGRES_PORT

WORKDIR /go/app
COPY ./api /go/app

RUN apk --no-cache update \
    && apk add --no-cache git tzdata \
    && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && apk del tzdata \
    && rm -rf /var/cache/apk/* \
    && go get gopkg.in/urfave/cli.v2@master \
    && go get github.com/oxequa/realize

CMD realize start
