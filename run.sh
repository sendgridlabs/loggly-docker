#!/bin/sh

if [ -z "$TOKEN" ]; then
  echo "Missing \$TOKEN"
  exit 1
fi

if [ -z "$TAG" ]; then
  echo "Missing \$TAG"
  exit 1
fi

sed -i "s/TOKEN/$TOKEN/" /etc/rsyslog.conf
sed -i "s/TAG/$TAG/" /etc/rsyslog.conf

exec /usr/sbin/rsyslogd -n

