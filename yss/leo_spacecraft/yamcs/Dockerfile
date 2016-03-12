FROM yamcs/yamcs:0.29.3

COPY tcp.yaml etc/tcp.yaml
COPY logging.yamcs-server.properties etc/logging.yamcs-server.properties

RUN cd /root/yamcs \
 && rm -f make-live-devel-local.sh \
 && ./make-live-devel.sh

RUN sed -i 's/landing/leo_spacecraft/g' etc/yamcs.simulator.yaml
