---
layout: default
permalink: /docs/server/System_Parameters_Collector/
sidebar: yes
---

Collects system parameters from any Yamcs component at a frequency of 1Hz. Parameter values are emitted to the <tt>sys_var</tt> stream.

### Class Name
{% javadoc org/yamcs/parameter/SystemParametersCollector %}

### Configuration

This service is defined in <tt>etc/yamcs.(instance).yaml</tt>. Example from a typical deployment:

{% yaml yamcs.simulator.yaml %}
services:
  - class: org.yamcs.parameter.SystemParametersCollector
    args:
      provideJvmVariables: true
{% endyaml %}

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
