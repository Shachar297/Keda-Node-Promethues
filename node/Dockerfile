FROM alpine:latest

USER root

RUN apk add --no-cache nodejs npm

WORKDIR /prom

COPY . /prom

RUN npm init npm i

EXPOSE 5089

ENTRYPOINT node index.js