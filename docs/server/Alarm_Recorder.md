---
layout: default
permalink: /docs/server/Alarm_Recorder/
sidebar: yes
---

Records alarms. This service stores the data coming from one or more streams into a table <tt>alarms</tt>.

### Class Name
[<tt>org.yamcs.archive.AlarmRecorder</tt>](https://www.yamcs.org/yamcs/javadoc/org/yamcs/archive/AlarmRecorder.html)

### Configuration

This service is defined in <tt>etc/yamcs.(instance).yaml</tt>. Example from a typical deployment:

<pre class="r header">yamcs.simulator.yaml</pre>
```yaml
services:
  - class: org.yamcs.archive.AlarmRecorder

streamConfig:
  alarm:
    - alarms_realtime
```

With this configuration alarms emitted to the <tt>alarms_realtime</tt> stream are stored into the table <tt>alarms</tt>.
