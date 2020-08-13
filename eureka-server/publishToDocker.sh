#!/bin/bash
mvn clean install
docker build -t markthill/eureka-server .
docker push markthill/eureka-server