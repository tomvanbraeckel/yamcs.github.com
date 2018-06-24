---
layout: default
permalink: /docs/server/Alarm_Reporter/
sidebar: yes
---

Generates events for changes in the alarm state of any parameter of a specific processor. Note that this is independent from the actual alarm checking.

<div class="hint">
  This may evolve into a processor service in the near future.
</div>

### Class Name
[<tt>org.yamcs.alarms.AlarmReporter</tt>](https://javadoc.io/page/org.yamcs/yamcs-core/latest/org/yamcs/alarms/AlarmReporter.html)

### Configuration

This service is defined in <tt>etc/yamcs.(instance).yaml</tt>. Example from a typical deployment:

<pre class="r header">yamcs.simulator.yaml</pre>
```yaml
services:
  - class: org.yamcs.alarms.AlarmReporter
```

### Configuration Options

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">processor</td>
    <td class="code">string</td>
    <td>The name of the processor for which to generate events. By default is uses the first defined processor, which is usually <tt>realtime</tt>.</td>
  </tr>
  <tr>
    <td class="code">source</td>
    <td class="code">string</td>
    <td>The source name of the generated events. Default: <tt>AlarmChecker</tt></td>
  </tr>
</table>
