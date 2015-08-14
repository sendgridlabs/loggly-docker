#!/bin/sh

if [ -z "$LOGGLY_AUTH_TOKEN" ]; then
  echo "Missing \$LOGGLY_AUTH_TOKEN"
  exit 1
fi

if [ -z "$LOGGLY_TAG" ]; then
  echo "Missing \$LOGGLY_TAG"
  exit 1
fi

sed -i "s/LOGGLY_AUTH_TOKEN/$LOGGLY_AUTH_TOKEN/" /etc/rsyslog.conf
sed -i "s/LOGGLY_TAG/$LOGGLY_TAG/" /etc/rsyslog.conf

exec /usr/sbin/rsyslogd -n

