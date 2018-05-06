---
layout: default
permalink: /docs/server/Processor_Creator_Service/
sidebar: yes
---

Creates persistent processors during start-up of Yamcs.

### Configuration

This service is defined in <tt>etc/yamcs.(instance).yaml</tt>. Example from a typical deployment:

<pre class="r header">yamcs.simulator.yaml</pre>
```yaml
services:
  - class: org.yamcs.ProcessorCreatorService
    args:
      name: realtime
      type: realtime
```
