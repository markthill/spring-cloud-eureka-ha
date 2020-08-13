#!/bin/bash
mvn clean install
docker build -t markthill/eureka-client .
docker push markthill/eureka-client