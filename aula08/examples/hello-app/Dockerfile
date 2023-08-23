FROM gradle:jdk19-alpine as builder

WORKDIR /home/app

COPY ./ ./

RUN ./gradlew build


FROM openjdk:19-jdk-alpine

WORKDIR /home/app

COPY --from=builder /home/app/app/build/libs/app.jar ./

CMD [ "java", "-jar", "app.jar" ]