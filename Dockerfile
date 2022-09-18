FROM node:14.19.1-buster-slim AS node_builder
RUN --mount=target=/var/lib/apt/lists,type=cache,sharing=locked \
    --mount=target=/var/cache/apt,type=cache,sharing=locked \
    rm -f /etc/apt/apt.conf.d/docker-clean \
    && apt-get update && apt-get install -y git && apt-get install tar -y && apt-get install bzip2 -y \
    && apt install python2 -y && apt-get install build-essential -y && apt-get install python3 -y
RUN git config --global url."https://".insteadOf git://
RUN npm install -g bower
RUN npm install -g gulp
RUN npm install --global node-gyp@latest
RUN npm config set node_gyp $(npm prefix -g)/lib/node_modules/node-gyp/bin/node-gyp.js