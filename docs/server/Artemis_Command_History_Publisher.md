---
layout: default
permalink: /docs/server/Artemis_Command_History_Publisher/
sidebar: yes
---

Publish <tt>cmdhist</tt> stream data to an Artemis broker.

### Class Name
[<tt>org.yamcs.artemis.ArtemisCmdHistoryService</tt>](https://www.yamcs.org/yamcs/javadoc/org/yamcs/artemis/ArtemisCmdHistoryService.html)

### Configuration

This service is defined in <tt>etc/yamcs.(instance).yaml</tt>. Example from a typical deployment:

<pre class="r header">yamcs.simulator.yaml</pre>
```yaml
services:
  - class: org.yamcs.artemis.ArtemisCmdHistoryService
    args: [cmdhist_realtime, cmdhist_dump]
```

<tt>args</tt> must be a an array of strings indicating which streams to publish. For each stream the target address is composed as `instance.stream`. In the example tuples from the streams <tt>cmdhist_realtime</tt> and <tt>cmdhist_dump</tt> are published to the addresses <tt>simulator.cmdhist_realtime</tt> and <tt>simulator.cmdhist_dump</tt> respectively.

By default, messages are published to an embedded broker (in-VM). This assumes that [Artemis Server](../Artemis_Server/) was configured as a global service. In order to use an external broker you can configure the property <tt>artemisUrl</tt> in either <tt>etc/yamcs.(instance).yaml</tt> or <tt>etc/yamcs.yaml</tt>:

<pre class="r header">yamcs.simulator.yaml</pre>
```yaml
artemisUrl: tcp://remote-host1:5445
```

<pre class="r header">yamcs.yaml</pre>
```yaml
artemisUrl: tcp://remote-host1:5445
```

If defined, the instance-specific configuration is selected over the global configuration. The URL format follows Artemis conventions and is not further detailed in this manual.
