FROM node:14 as vsf-pre

WORKDIR /app

RUN apt-get install -y --no-install-recommends git \
  && git clone --depth=1 --branch v1.4.0 https://github.com/vuestorefront-community/template-odoo.git . \
  && yarn add wait-on \
  && yarn install \
  --prefer-offline \
  --frozen-lockfile \
  --non-interactive \
  --production=false \
  && yarn build

FROM node:14 as vsf2

WORKDIR /app

COPY --from=vsf-pre /app  .

VOLUME ["/apt/.nuxt"]

ENV HOST 0.0.0.0


CMD [ "yarn", "start" ]