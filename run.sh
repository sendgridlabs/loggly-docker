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

# If LOGGLY_DEBUG is true, write logs to stdout as well
if [ "$LOGGLY_DEBUG" = true ]; then
  sed -i "/\*\.\* @@logs-01\.loggly\.com.*/a \*\.\* \:omstdout\:" /etc/rsyslog.conf
fi

# Expand multiple tags, in the format of tag1:tag2:tag3, into several tag arguments
LOGGLY_TAG=$(echo "$LOGGLY_TAG" | sed 's/:/\\\\" tag=\\\\"/g')

# Replace variables
sed -i "s/LOGGLY_AUTH_TOKEN/$LOGGLY_AUTH_TOKEN/" /etc/rsyslog.conf
sed -i "s/LOGGLY_TAG/$LOGGLY_TAG/" /etc/rsyslog.conf

rm -f /var/run/rsyslogd.pid

# Run RSyslog daemon
exec /usr/sbin/rsyslogd -n

