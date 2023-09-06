FROM node:19.2.0-slim as stage

WORKDIR /home/app

COPY ./ ./

RUN ["npm", "install"]
RUN ["npx", "prisma", "generate"]
RUN ["npm", "run", "build"]



FROM node:19.2.0-slim

WORKDIR /home/app

COPY --from=stage /home/app/package*.json ./
COPY --from=stage /home/app/build ./build

RUN ["npm", "i", "--omit=dev"]

COPY --chown=node:node --from=stage /home/app/prisma ./prisma
COPY --chown=node:node --from=stage /home/app/node_modules/@prisma ./node_modules/@prisma
COPY --chown=node:node --from=stage /home/app/node_modules/.prisma ./node_modules/.prisma
COPY --chown=node:node --from=stage /home/app/node_modules/prisma ./node_modules/prisma

USER node

EXPOSE 3000

ENTRYPOINT [ "node", "./build/server/server.js" ]