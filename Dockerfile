FROM node:20

USER node

WORKDIR /home/node/code

COPY --chown=node:node package*.json ./

RUN npm ci

COPY --chown=node:node . .

CMD ["node", "index.js"]