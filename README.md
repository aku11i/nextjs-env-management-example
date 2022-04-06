# nextjs-env-management-example

## Setup

```sh
yarn install
```

## Development

```sh
yarn dev
# APP_ENV=dev-1 yarn dev
```

## Build & Start

```sh
yarn build
# APP_ENV=dev-1 yarn build
yarn start
```

## Docker

```sh
yarn docker:build
# yarn docker:build --build-arg APP_ENV=dev-1
yarn docker:run
```

## Test

```sh
yarn test
```
