ARG APP_ENV=local

FROM node:16-alpine AS deps

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

FROM node:16-alpine AS builder

ARG APP_ENV

ENV APP_ENV=${APP_ENV}

WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

RUN yarn build

RUN NODE_ENV=production yarn install --frozen-lockfile

FROM node:16-alpine AS runner

ARG APP_ENV

ENV APP_ENV=${APP_ENV}

ENV NODE_ENV production

WORKDIR /app

COPY --from=builder /app/env ./env
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/next.config.js ./
COPY --from=builder /app/public ./public
COPY --from=builder /app/package.json ./package.json

EXPOSE 3000

ENV PORT 3000

CMD ["yarn", "start"]
