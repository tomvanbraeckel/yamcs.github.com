---
layout: default
permalink: /docs/server/TM_DataLinks/
sidebar: yes
---

TM data links are components that collect data from external sources and inject them into a Yamcs stream. They are defined in the instance configuration file as part of the <tt>tmDataLinks</tt> list.

Each TM Provider is defined in terms of an identifying name, a class (the java class instantiated by Yamcs to load the provider), a specification (used as an argument when instantiating the class) and the name of the stream where the data will be injected. There is also a property <tt>enabledAtStartup</tt> which allows to enable (default) or disable the TM provider for connecting to the external data source at the server start-up.

An example configuration:
<pre>
<code class="config-file">
tmProviders:
    - class: org.yamcs.tctm.TcpTmDataLink
      name: tm_realtime
      spec: local
      stream: tm_realtime
    - class: org.yamcs.tctm.TcpTmDataLink
      name: tm_dump
      spec: localDump
      stream: tm_dump
</code>
</pre>

Yamcs provides by default the following TM Providers:

- org.yamcs.tctm.TcpTmDataLink
- org.yamcs.tctm.MulticastTmDataLink
- org.yamcs.tctm.HornetQTmDataLink

### org.yamcs.tctm.TcpTmDataLink
Provides packets received via plain TCP sockets. The packets in CCSDS format are expected one after the other without any delimiter or separator (the length is deduced from the CCSDS header).

The specification consists of a name which selects a configuration defined in the file [etc/tcp.yaml](/docs/server/tcp.yaml/).

In case the TCP connection with the telemetry server cannot be opened or is broken, it retries to connect each 10 seconds.


### org.yamcs.tctm.MulticastTmDataLink
This class listens to a multicast (or UDP) port for datagrams containing CCSDS packets.

The specification consists of a name which selects a configuration defined in the file [etc/multicast.yaml](/docs/server/multicast.yaml/).


### org.yamcs.tctm.HornetQTmDataLink
This class reads data from a HornetQ queue. Upon startup, the class will create the queue and bind it to the address which is specified in the spec parameter.