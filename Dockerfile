FROM ubuntu:latest AS build
RUN apt-get update
RUN apt-get install openjdk-17-jdk-y
COPY  ..
RUN ./gradlew bootjar --no-daemon

FROM openjdk:17-jdk-slim
expose 8080
COPY --from-build /build/libs/demo-1.jar app.jar

entrypoint ["java","-jar","app.jar"]
