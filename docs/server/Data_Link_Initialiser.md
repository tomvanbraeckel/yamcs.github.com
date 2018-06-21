---
layout: default
permalink: /docs/server/Data_Link_Initialiser/
sidebar: yes
section: yes
---

Manages the various data links and creates needed streams during Yamcs start-up.

Data Links represent input or output flows. There are three types of Data Links: TM, TC  and PP (Processed Parameter). TM and PP receive telemetry packets or parameters and inject them into the realtime or dump TM or PP streams. TC data links subscribe to the realtime TC stream and send data to external systems.

Note that any Yamcs Ssrvice can connect to external sources and inject data in the streams. Data links however, can report on their status using a predefined interface and can also be controlled to connect or disconnect from their data source. This can be done from client applications such as Yamcs web interface or Yamcs Studio.

### Class Name
[<tt>org.yamcs.tctm.DataLinkInitialiser</tt>](https://javadoc.io/page/org.yamcs/yamcs-core/latest/org/yamcs/tctm/DataLinkInitialiser.html)

### Configuration

This service is defined in <tt>etc/yamcs.(instance).yaml</tt>. Example from a typical deployment:

<pre class="r header">yamcs.simulator.yaml</pre>
```yaml
services:
  - org.yamcs.tctm.DataLinkInitialiser

tmDataLinks:
  - class: org.yamcs.tctm.TcpTmDataLink
    name: tm_realtime
    args: local
    stream: tm_realtime
  - class: org.yamcs.tctm.TcpTmDataLink
    name: tm_dump
    args: localDump
    stream: tm_dump
  - class: org.yamcs.tctm.UdpTmDataLink
    name: tm_realtime
    stream: tm_realtime
    args: 
      port: 5900
      maxLength: 2048

tcDataLinks: []

parameterDataLinks: []
```

<strong>TM data links</strong> are components that collect data from external sources and inject them into a Yamcs stream. They are defined in the instance configuration file as part of the <tt>tmDataLinks</tt> list.

Each TM Provider is defined in terms of an identifying name, a class (the java class instantiated by Yamcs to load the provider), a specification (used as an argument when instantiating the class) and the name of the stream where the data will be injected. There is also a property <tt>enabledAtStartup</tt> which allows to enable (default) or disable the TM provider for connecting to the external data source at the server start-up.

Specific TM Data Links may support additional arbitrary configuration options via the <tt>args</tt> key.

<strong>TC data links</strong> are components that send commands to external entities.

<strong>Parameter Data Links</strong> are components that collect processed parameters from external sources and inject them into a Yamcs stream. They are defined in the instance configuration file as part of the <tt>parameterDataLinks</tt> list.

Each parameter data link is defined in terms of an identifying name, a class (the java class instantiated by Yamcs to load the provider), a specification (used as an argument when instantiating the class) and the name of the stream where the data will be injected. There is also a property <tt>enabledAtStartup</tt> which allows to enable (default) or disable the parameter provider for connecting to the external data source at the server start-up.
