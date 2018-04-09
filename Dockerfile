FROM alpine:3.6
LABEL maintainer="Jonathan Short <jonathan.short@sendgrid.com>"

RUN rm -rf /var/cache/apk/* && apk update && \
    apk add --update rsyslog rsyslog-tls && \
    rm -rf /var/cache/apk/*

ADD run.sh /tmp/run.sh
RUN chmod +x /tmp/run.sh
ADD rsyslog.conf /etc/
ADD loggly.crt /etc/rsyslog.d/keys/ca.d/

EXPOSE 514
EXPOSE 514/udp

CMD ["/tmp/run.sh"]
