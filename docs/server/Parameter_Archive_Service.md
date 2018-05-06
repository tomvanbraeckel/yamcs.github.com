---
layout: default
permalink: /docs/server/Parameter_Archive_Service/
sidebar: yes
---

Creates persistent processors during start-up of Yamcs.

### Configuration

This service is defined in <tt>etc/yamcs.(instance).yaml</tt>. Example from a typical deployment:

<pre class="r header">yamcs.simulator.yaml</pre>
```yaml
services:
  - class: org.yamcs.parameterarchive.ParameterArchive
    args:
      realtimeFiller:
        enabled: true
        flushInterval: 60
```
