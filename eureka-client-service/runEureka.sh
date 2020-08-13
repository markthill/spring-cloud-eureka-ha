#!/bin/sh
export AWS_DEFAULT_REGION="us-east-1"

#Default Run with no eureka cluster configurations
#java -jar app.jar

# Run below for tailing logs
# sudo docker logs -f `sudo docker ps | cut -d ' ' -f 1 | grep -v 'CONTAINER'`

## My Local IP of Agent
#LOCAL_IP=`curl -s http://169.254.169.254/latest/meta-data/local-ipv4`
## Using Public IP
#PUBLIC_IP=`curl -s http://169.254.169.254/latest/meta-data/public-ipv4`
## Using Private IP
## COMPLETE LIST OF AGENTS CREATING DEFAULT ZONE STRING
#DEFAULT_ZONES=`aws ec2 describe-instances --query 'Reservations[*].Instances[*].PrivateIpAddress' --filter 'Name=tag:Tier,Values=mesos-Agent' | jq .[][0] | grep -v $LOCAL_IP | sed 's/"/https\:\/\//' | sed 's/"/\:8763\/eureka\//' | tr '\n' ',' | sed 's/.$//'`
#java -Deureka.client.serviceUrl.defaultZone=$DEFAULT_ZONES -Deureka.instance.ip-address=$LOCAL_IP -Deureka.instance.hostname=$LOCAL_IP -Dspring.cloud.client.hostname=$PUBLIC_IP -jar app.jar



## My Local IP of Agent
#LOCAL_IP=`curl -s http://169.254.169.254/latest/meta-data/local-ipv4`
## Using Public IP
#PUBLIC_IP=`curl -s http://169.254.169.254/latest/meta-data/public-ipv4`
## Using Private IP
## COMPLETE LIST OF AGENTS CREATING DEFAULT ZONE STRING
#DEFAULT_ZONES=`aws ec2 describe-instances --query 'Reservations[*].Instances[*].PublicIpAddress' --filter 'Name=tag:Tier,Values=mesos-Agent' | jq .[][0] | grep -v $PUBLIC_IP | sed 's/"/http\:\/\//' | sed 's/"/\:8763\/eureka\//' | tr '\n' ',' | sed 's/.$//'`
#java -Deureka.client.serviceUrl.defaultZone=$DEFAULT_ZONES -Deureka.instance.ip-address=$PUBLIC_IP -Deureka.instance.hostname=$PUBLIC_IP -Dspring.cloud.client.hostname=$PUBLIC_IP -jar app.jar

# My Local IP of Agent
LOCAL_IP=`curl -s http://169.254.169.254/latest/meta-data/local-ipv4`
# Using Public IP
PUBLIC_IP=`curl -s http://169.254.169.254/latest/meta-data/public-ipv4`
# Using Private IP
# COMPLETE LIST OF AGENTS CREATING DEFAULT ZONE STRING
#DEFAULT_ZONES=`aws ec2 describe-instances --query 'Reservations[*].Instances[*].PublicIpAddress' --filter 'Name=tag:Tier,Values=mesos-Agent' | jq .[][0] | grep -v $LOCAL_IP | sed 's/"/http\:\/\//' | sed 's/"/\:8761\/eureka\//' | tr '\n' ',' | sed 's/.$//'`
DEFAULT_ZONES=`aws ec2 describe-instances --query 'Reservations[*].Instances[*].PrivateIpAddress' --filter 'Name=tag:Tier,Values=mesos-Agent' | jq .[][0] | sed 's/"/http\:\/\//' | sed 's/"/\:8761\/eureka\//' | tr '\n' ',' | sed 's/.$//'`
#java -Deureka.client.serviceUrl.defaultZone=$DEFAULT_ZONES -Deureka.instance.ip-address=$LOCAL_IP -Deureka.instance.hostname=$PUBLIC_IP -Dspring.cloud.client.hostname=$PUBLIC_IP -jar app.jar
java -Deureka.client.serviceUrl.defaultZone=$DEFAULT_ZONES -Deureka.instance.instanceId=$LOCAL_IP -Deureka.instance.ip-address=$PUBLIC_IP -Deureka.instance.hostname=$LOCAL_IP -Dspring.cloud.client.hostname=$PUBLIC_IP -jar app.jar
java -Deureka.client.serviceUrl.defaultZone=$DEFAULT_ZONES -Deureka.instance.instanceId=$LOCAL_IP -Deureka.instance.ip-address=$LOCAL_IP -Deureka.instance.hostname=$LOCAL_IP -Dspring.cloud.client.hostname=$PUBLIC_IP -jar app.jar

#AVAILABILITY_ZONE=$(curl -s curl http://169.254.169.254/latest/meta-data/placement/availability-zone)
#java -Dspring.profiles.active=$AVAILABILITY_ZONE -jar app.jar