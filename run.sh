#!/bin/sh

# Fail if LOGGLY_AUTH_TOKEN is not set
if [ -z "$LOGGLY_AUTH_TOKEN" ]; then
  echo "Missing \$LOGGLY_AUTH_TOKEN"
  exit 1
fi

# Fail if LOGGLY_TAG is not set
if [ -z "$LOGGLY_TAG" ]; then
  echo "Missing \$LOGGLY_TAG"
  exit 1
fi

# Create spool directory
mkdir -p /var/spool/rsyslog

# Expand multiple tags, in the format of tag1:tag2:tag3, into several tag arguments
LOGGLY_TAG=$(echo $LOGGLY_TAG | sed 's/:/\\\\" tag=\\\\"/g')

# Replace variables
sed -i "s/LOGGLY_AUTH_TOKEN/$LOGGLY_AUTH_TOKEN/" /etc/rsyslog.conf
sed -i "s/LOGGLY_TAG/$LOGGLY_TAG/" /etc/rsyslog.conf

# Run RSyslog daemon
exec /usr/sbin/rsyslogd -n

