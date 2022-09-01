FROM node:14 as vsf-pre

WORKDIR /app


RUN apt-get install -y --no-install-recommends git \
  && git clone --recurse-submodules --branch dev https://github.com/odoogap/vuestorefront-demos.git vsf \
  && mv vsf/demo-1/* . \
  && rm -rf vsf \
  && yarn add wait-on \
  && yarn install \
  --prefer-offline \
  --frozen-lockfile \
  --non-interactive \
  --production=false

RUN yarn build

RUN rm -rf node_modules && \
  NODE_ENV=development yarn install \
  --prefer-offline \
  --pure-lockfile \
  --non-interactive \
  --production=false

FROM node:14 as vsf2

WORKDIR /app

COPY --from=vsf-pre /app  .

VOLUME ["/apt/.nuxt"]

ENV HOST 0.0.0.0


CMD [ "yarn", "start" ]