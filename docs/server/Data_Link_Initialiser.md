---
layout: default
permalink: /docs/server/Data_Link_Initialiser/
sidebar: yes
section: yes
---

Manages the various data links and creates needed streams during Yamcs start-up.

Data Links represent data connections to external sources. These connections may represent output flows (TC), input flows (TM, PP) or a combination of these. Data links that read TM and PP data receive telemetry packets or parameters and inject them into the realtime or dump TM or PP streams. Data links that send TC subscribe to a TC stream and send data to external systems.

Note that any Yamcs Service can connect to external sources and inject data in the streams. Data links however, can report on their status using a predefined interface and can also be controlled to connect or disconnect from their data source.

### Class Name
[<tt>org.yamcs.tctm.DataLinkInitialiser</tt>](https://javadoc.io/page/org.yamcs/yamcs-core/latest/org/yamcs/tctm/DataLinkInitialiser.html)

### Configuration

This service is defined in <tt>etc/yamcs.(instance).yaml</tt>. Example from a typical deployment:

<pre class="r header">yamcs.simulator.yaml</pre>
```yaml
services:
  - class: org.yamcs.tctm.DataLinkInitialiser

dataLinks:
  - name: tm_realtime
    class: org.yamcs.tctm.TcpTmDataLink
    stream: tm_realtime
    args:
      host: localhost
      port: 10015
  - name: tm_dump
    class: org.yamcs.tctm.TcpTmDataLink
    stream: tm_dump
    args:
      host: localhost
      port: 10115
  - name: udp_realtime
    class: org.yamcs.tctm.UdpTmDataLink
    stream: tm_realtime
    args: 
      port: 5900
      maxLength: 2048
  - name: tc_realtime
    class: org.yamcs.tctm.TcpTcDataLink
    stream: tc_realtime
    args:
      host: localhost
      port: 10025
```

Each link is defined in terms of an identifying name, a class (the java class instantiated by Yamcs to load the provider) and the name of the stream where the data will be injected. There is also a property <tt>enabledAtStartup</tt> which allows to enable (default) or disable the TM provider for connecting to the external data source at the server start-up.

Specific TM Data Links may support additional arbitrary configuration options via the <tt>args</tt> key.
