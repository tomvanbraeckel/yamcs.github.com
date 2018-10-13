---
layout: default
permalink: /docs/server/Artemis_TM_Publisher/
sidebar: yes
---

Publish <tt>tm</tt> stream data to an Artemis broker.

### Class Name
[<tt>org.yamcs.artemis.ArtemisTmService</tt>](https://www.yamcs.org/yamcs/javadoc/index.html?org/yamcs/artemis/ArtemisTmService.html)

### Configuration

This service is defined in <tt>etc/yamcs.(instance).yaml</tt>. Example from a typical deployment:

<pre class="r header">yamcs.simulator.yaml</pre>
```yaml
services:
  - class: org.yamcs.artemis.ArtemisTmService
    args: [tm_realtime, tm_dump]
```

<tt>args</tt> must be a an array of strings indicating which streams to publish. For each stream the target address is composed as `instance.stream`. In the example tuples from the streams <tt>tm_realtime</tt> and <tt>tm_dump</tt> are published to the addresses <tt>simulator.tm_realtime</tt> and <tt>simulator.tm_dump</tt> respectively.

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
