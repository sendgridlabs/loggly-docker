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

echo "working with netcat"

sudo service rsyslog restart

#using netcat to send logs to UDP port 514 in the local machine
echo -n "Hello, I am a netcat log" | nc -4u -w1 127.0.0.1 514
