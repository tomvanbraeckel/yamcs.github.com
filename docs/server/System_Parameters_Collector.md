---
layout: default
permalink: /docs/server/System_Parameters_Collector/
sidebar: yes
---

Collects system parameters from any Yamcs component at a frequency of 1Hz. Parameter values are emitted to the <tt>sys_var</tt> stream.

### Class Name
[<tt>org.yamcs.parameter.SystemParametersCollector</tt>](https://www.yamcs.org/yamcs/javadoc/index.html?org/yamcs/parameter/SystemParametersCollector.html)

### Configuration

This service is defined in <tt>etc/yamcs.(instance).yaml</tt>. Example from a typical deployment:

<pre class="r header">yamcs.simulator.yaml</pre>
```yaml
services:
  - class: org.yamcs.parameter.SystemParametersCollector
    args:
      provideJvmVariables: true
```

### Configuration Options

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">provideJvmVariables</td>
    <td class="code">boolean</td>
    <td>When set to <tt>true</tt> this service will create a few system parameters that allows monitoring basic JVM properties such as memory usage and thread count. Default: <tt>false</tt></td>
  </tr>
</table>
