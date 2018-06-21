---
layout: default
permalink: /docs/server/Replay_Server/
sidebar: yes
---

This service handles replay requests of archived data. Each replay runs with a separate processor that runs in parallel to the realtime processing.

### Class Name
[<tt>org.yamcs.archive.ReplayServer</tt>](https://javadoc.io/page/org.yamcs/yamcs-core/latest/org/yamcs/archive/ReplayServer.html)

### Configuration

This service is defined in <tt>etc/yamcs.(instance).yaml</tt>. Example from a typical deployment:

<pre class="r header">yamcs.simulator.yaml</pre>
```yaml
services:
  - org.yamcs.archive.ReplayServer
```
