# build step
FROM node:20 AS node-builder
WORKDIR /build
COPY package*.json ./
RUN npm ci
COPY . .

# production step
FROM alpine:3.23.3
RUN apk add --update nodejs
RUN addgroup -S node && adduser -S node -G node
USER node
WORKDIR /home/node/code
COPY --from=node-builder --chown=node:node /build .
CMD ["node", "index.js"]