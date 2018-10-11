---
layout: default
permalink: /docs/server/Artemis_Parameter_Publisher/
sidebar: yes
---

Publish <tt>param</tt> stream data to an Artemis broker.

### Class Name
[<tt>org.yamcs.artemis.ArtemisPpService</tt>](https://www.yamcs.org/yamcs/javadoc/org/yamcs/artemis/ArtemisPpService.html)

### Configuration

This service is defined in <tt>etc/yamcs.(instance).yaml</tt>. Example from a typical deployment:

<pre class="r header">yamcs.simulator.yaml</pre>
```yaml
services:
  - class: org.yamcs.artemis.ArtemisPpService
    args: [pp_realtime, pp_dump, sys_param]
```

<tt>args</tt> must be a an array of strings indicating which streams to publish. For each stream the target address is composed as `instance.stream`. In the example tuples from the streams <tt>pp_realtime</tt>, <tt>pp_dump</tt> and <tt>pp_dump</tt> are published to the addresses <tt>simulator.pp_realtime</tt>, <tt>simulator.pp_dump</tt> and <tt>simulator.pp_sys_param</tt> respectively.

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
