---
layout: default
permalink: /docs/server/System_Parameters_Collector/
sidebar: yes
---

Collects system parameters from any Yamcs component at a frequency of 1Hz. Parameter values are emitted to the <tt>sys_var</tt> stream.

### Configuration

This service is defined in <tt>etc/yamcs.(instance).yaml</tt>. Example from a typical deployment:

<pre class="r header">yamcs.simulator.yaml</pre>
```yaml
services:
  - class: org.yamcs.parameter.SystemParametersCollector
    args:
      provideJvmVariables: true
```
