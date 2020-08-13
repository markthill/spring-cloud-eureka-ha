#!/bin/bash
./publishToDocker.sh
MARATHON_IP=`aws ec2 describe-instances --query 'Reservations[*].Instances[*].PublicIpAddress' --filter 'Name=tag:Tier,Values=mesos-Marathon' | jq .[][0] | tr -d '"' | tr -d '\n'`
curl -k -X POST https://$MARATHON_IP:8082/v2/apps -d @application.json -H "Content-type: application/json"
