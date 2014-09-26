#!/bin/bash

if [ -z "$TOKEN" ]; then
  echo "Missing \$TOKEN"
  exit 1
fi

if [ -z "$TAG" ]; then
  echo "Missing \$TAG"
  exit 1
fi

sed -i "s/TOKEN/$TOKEN/" /etc/rsyslog.d/50-default.conf
sed -i "s/TAG/$TAG/" /etc/rsyslog.d/50-default.conf

#restarting rsyslog to load the 50-default.conf file
sudo service rsyslog restart

#we are sending the event to verify the container is receiving logs successfully
echo netcat:"Starting Docker container"| nc -u -w 1 127.0.0.1 514


