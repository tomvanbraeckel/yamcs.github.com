---
layout: default
permalink: /docs/server/Alarm_Reporter/
sidebar: yes
---

Generates events for changes in the alarm state of any parameter on the specific processor. Note that this is independent from the actual alarm checking.

### Class Name
[<tt>org.yamcs.alarms.AlarmReporter</tt>](https://www.yamcs.org/yamcs/javadoc/index.html?org/yamcs/alarms/AlarmReporter.html)

### Configuration

This service is defined in <tt>etc/processor.yaml</tt>. Example from a typical deployment:

<pre class="r header">processor.yaml</pre>
```yaml
realtime:
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
    <td class="code">source</td>
    <td class="code">string</td>
    <td>The source name of the generated events. Default: <tt>AlarmChecker</tt></td>
  </tr>
</table>
