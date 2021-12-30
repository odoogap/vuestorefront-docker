FROM node:14 as vsf-pre

WORKDIR /app

COPY ./env /


RUN apt-get install -y --no-install-recommends git \
  && git clone https://github.com/vuestorefront-community/odoo.git . \
  && cp -rf /env /app/packages/theme/.env \
  && cp -rf /env /app/packages/theme/.env_production \
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

ENV HOST 0.0.0.0


CMD [ "yarn", "start" ]