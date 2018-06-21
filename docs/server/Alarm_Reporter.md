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
  - org.yamcs.alarms.AlarmReporter
```

### Configuration Options

<dl>
  <dt><tt>processor</tt></dt>
  <dd>The name of the processor for which to generate events. By default is uses the first defined processor, which is usually <tt>realtime</tt>.</dd>

  <dt><tt>source</tt></dt>
  <dd>The source name of the generated events. Default: <tt>AlarmChecker</tt></dd>
</dl>
