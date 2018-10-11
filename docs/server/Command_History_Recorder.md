---
layout: default
permalink: /docs/server/Command_History_Recorder/
sidebar: yes
---

Records command history entries. This service stores the data coming from one or more streams into a table <tt>cmdhist</tt>.

### Class Name
[<tt>org.yamcs.archive.CommandHistoryRecorder</tt>](https://www.yamcs.org/yamcs/javadoc/org/yamcs/archive/CommandHistoryRecorder.html)

### Configuration

This service is defined in <tt>etc/yamcs.(instance).yaml</tt>. Example from a typical deployment:

<pre class="r header">yamcs.simulator.yaml</pre>
```yaml
services:
  - class: org.yamcs.archive.CommandHistoryRecorder

streamConfig:
  event:
    - cmdhist_realtime
    - cmdhist_dump
```

With this configuration events emitted to the <tt>cmdhist_realtime</tt> or <tt>cmdhist_dump</tt> stream are stored into the table <tt>cmdhist</tt>.
