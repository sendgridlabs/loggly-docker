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


if [ -f "/usr/sbin/rsyslogd" ]; then
	
	#using rsyslogd if rsyslogd folder is present
	exec rsyslogd -n
elif [-f "/usr/sbin/syslogd" ]; then
	
	#using syslogd if syslogd folder is present
	exec syslogd -n
else
	echo "Unable to locate syslog service"
	exit 1
fi