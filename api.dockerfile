FROM golang:1.13-alpine
ENV LANG='ja_JP.utf8'
ENV GO111MODULE='on'

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
