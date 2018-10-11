---
layout: default
permalink: /docs/server/Event_Recorder/
sidebar: yes
---

Records events. This service stores the data coming from one or more streams into a table <tt>events</tt>.

### Class Name
[<tt>org.yamcs.archive.EventRecorder</tt>](https://www.yamcs.org/yamcs/javadoc/org/yamcs/archive/EventRecorder.html)

### Configuration

This service is defined in <tt>etc/yamcs.(instance).yaml</tt>. Example from a typical deployment:

<pre class="r header">yamcs.simulator.yaml</pre>
```yaml
services:
  - class: org.yamcs.archive.EventRecorder

streamConfig:
  event:
    - events_realtime
    - events_dump
```

With this configuration events emitted to the <tt>events_realtime</tt> or <tt>events_dump</tt> stream are stored into the table <tt>events</tt>.
