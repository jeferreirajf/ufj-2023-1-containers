FROM ubuntu:23.10

WORKDIR /home/app

COPY ./helloworld.js ./

RUN apt-get update 
RUN apt-get install nodejs -y

ENTRYPOINT [ "node", "helloworld.js" ]