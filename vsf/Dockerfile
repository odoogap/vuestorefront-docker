ARG NODE_VERSION=20.8
ARG YARN_VERSION=3.6.1

FROM node:${NODE_VERSION}-slim as vsf-pre
ARG TAG_BRANCH=main
ARG REDIS_URL="redis://redis:6379"
ENV REDIS_URL=$REDIS_URL
WORKDIR /src

RUN apt-get update &&  apt-get install -y --no-install-recommends git ca-certificates \
  && rm -rf /var/lib/apt/lists/* \
  && git clone --depth=1 --recurse-submodules --branch ${TAG_BRANCH} https://github.com/odoogap/storefront-ui . \
  && yarn add wait-on -W \
  && yarn install \
  --prefer-offline \
  --frozen-lockfile \
  --non-interactive \
  --production=false \
  && yarn build

FROM vsf-pre as vsf2
ENV PORT=$PORT
ENV REDIS_URL=$REDIS_URL

COPY --from=vsf-pre /src/apps/web/.output ./

ENV HOST 0.0.0.0
CMD [ "node", "/src/server/index.mjs" ]