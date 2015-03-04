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

exec /usr/sbin/rsyslogd -n
