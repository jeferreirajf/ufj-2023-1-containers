FROM ubuntu:23.10

WORKDIR /home/app

COPY ./main.go ./

RUN apt update 
RUN apt install -y golang

ENTRYPOINT [ "go", "run", "main.go" ]