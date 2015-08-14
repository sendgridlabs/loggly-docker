#################################################################
#
#                    ##        .
#              ## ## ##       ==
#           ## ## ## ##      ===
#       /""""""""""""""""\___/ ===
#  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
#       \______ o          __/
#         \    \        __/
#          \____\______/
#
#################################################################

FROM alpine:3.2
MAINTAINER Jonathan Short <jonathan.short@sendgrid.com>

RUN apk add --update rsyslog && rm -rf /var/cache/apk/*

ADD run.sh /tmp/run.sh
RUN chmod +x /tmp/run.sh
ADD rsyslog.conf /etc/

EXPOSE 514
EXPOSE 514/udp

CMD ["/tmp/run.sh"]

