ARG IMAGE_NODE_VERSION="20.10.0"
ARG YARN_VERSION="3.6.1"
ARG PORT=3000

FROM node:${IMAGE_NODE_VERSION}-slim AS alokai-pre

ARG TAG_BRANCH="main" \
    GIT_REPO="https://github.com/erpgap/storefront-ui" \
    NUXT_STORAGE_DRIVER="redis" \
    NUXT_STORAGE_URL="redis://redis:6379" \
    IMAGE_NODE_VERSION PORT

ENV NUXT_STORAGE_URL=$NUXT_STORAGE_URL \
    NUXT_STORAGE_DRIVER=$NUXT_STORAGE_DRIVER \
    GIT_REPO=$GIT_REPO \
    TAG_BRANCH=$TAG_BRANCH \
    NODE_VERSION=$IMAGE_NODE_VERSION
    
WORKDIR /src

RUN apt-get update &&  apt-get install -y --no-install-recommends git ca-certificates \
  && rm -rf /var/lib/apt/lists/* \
  && git clone --depth=1 --recurse-submodules --branch ${TAG_BRANCH} ${GIT_REPO} . \
  && yarn add wait-on -W \
  && yarn install \
  --prefer-offline \
  --frozen-lockfile \
  --non-interactive \
  --production=false \
  && yarn build

FROM alokai-pre AS alokai

ARG IMAGE_NODE_VERSION

ENV PORT=$PORT \
    NUXT_STORAGE_URL=$NUXT_STORAGE_URL \
    HOST=0.0.0.0 \
    NODE_VERSION=$IMAGE_NODE_VERSION

COPY --from=alokai-pre /src/.output ./

CMD [ "node", "/src/server/index.mjs" ]
