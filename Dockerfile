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

FROM ubuntu:trusty
MAINTAINER psquickitjayant

RUN apt-get update
RUN apt-get -y dist-upgrade

ADD https://raw.githubusercontent.com/psquickitjayant/loggly-docker/psquickit-dev/run.sh /tmp/
RUN chmod +x /tmp/run.sh

ADD https://raw.githubusercontent.com/psquickitjayant/loggly-docker/psquickit-dev/50-default.conf /etc/rsyslog.d/

EXPOSE 514
EXPOSE 514/udp

CMD ["/tmp/run.sh"]

