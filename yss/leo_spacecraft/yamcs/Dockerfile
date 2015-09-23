FROM yamcs/yamcs:0.28.1

COPY tcp.yaml etc/tcp.yaml
COPY logging.yamcs-server.properties etc/logging.yamcs-server.properties
RUN sed -i 's/landing/leo_spacecraft/g' etc/yamcs.simulator.yaml
