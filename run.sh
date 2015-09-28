#!/bin/sh

# Fail if LOGGLY_AUTH_TOKEN is not set
if [ -z "$LOGGLY_AUTH_TOKEN" ]; then
  if [ ! -z "$TOKEN" ]; then
    # grandfather old env var
    export LOGGLY_AUTH_TOKEN=$TOKEN
  else
    echo "Missing \$LOGGLY_AUTH_TOKEN"
    exit 1
  fi
fi

# Fail if LOGGLY_TAG is not set
if [ -z "$LOGGLY_TAG" ]; then
  if [ ! -z "$TAG" ]; then
    # grandfather old env var
    export LOGGLY_TAG=$TAG
  else
    echo "Missing \$LOGGLY_TAG"
    exit 1
  fi
fi

# Create spool directory
mkdir -p /var/spool/rsyslog

# Replace variables
sed -i "s/LOGGLY_AUTH_TOKEN/$LOGGLY_AUTH_TOKEN/" /etc/rsyslog.conf
sed -i "s/LOGGLY_TAG/$LOGGLY_TAG/" /etc/rsyslog.conf

# Run RSyslog daemon
exec /usr/sbin/rsyslogd -n

