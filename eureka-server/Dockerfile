FROM openjdk:8-jdk-alpine
RUN apk add --update python python-dev py-pip build-base && pip install awscli
RUN apk add jq
RUN apk add curl
RUN apk add --no-cache --upgrade bash
ARG JAR_FILE=target/*.jar
COPY runEureka.sh runEureka.sh
RUN chmod 700 runEureka.sh
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["./runEureka.sh"]