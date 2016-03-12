FROM yamcs/yamcs:0.29.3

RUN cd /root/yamcs \
 && rm -f make-live-devel-local.sh \
 && ./make-live-devel.sh \
 && cp yamcs-simulation/etc/* live/etc/

COPY tcp.yaml etc/tcp.yaml
COPY logging.yamcs-server.properties etc/logging.yamcs-server.properties
