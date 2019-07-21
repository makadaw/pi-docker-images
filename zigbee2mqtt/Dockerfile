FROM node:10-alpine

LABEL maintainer="makadaw@gmail.com" \
	version="1.0" \
	description="Zigbee2mqqt image"

ENV NODE_ENV="production"

WORKDIR /opt/zigbee2mqtt

RUN apk add --no-cache --virtual .build-deps \
  make gcc g++ python linux-headers udev git && \
  git clone https://github.com/Koenkk/zigbee2mqtt.git . && \
  echo "{\"hash\": \"$(git rev-parse --verify HEAD)\"}" > .hash.json && \
  npm install --unsafe-perm --production && \
  apk del .build-deps

CMD npm start
