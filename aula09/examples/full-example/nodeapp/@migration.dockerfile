FROM node:19.2.0-slim

WORKDIR /home/app

COPY ./ ./

RUN ["npm", "install"]

ENTRYPOINT [ "npx", "prisma", "db", "push" ]