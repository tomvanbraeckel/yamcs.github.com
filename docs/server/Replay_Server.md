---
layout: default
permalink: /docs/server/Replay_Server/
sidebar: yes
---

Supports replaying archived data. Each replay runs with a separate processor that runs in parallel to the realtime processing.

### Configuration

This service is defined in <tt>etc/yamcs.(instance).yaml</tt>. Example from a typical deployment:

<pre class="r header">yamcs.simulator.yaml</pre>
```yaml
services:
  - org.yamcs.archive.ReplayServer
```
