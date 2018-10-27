---
layout: default
permalink: /docs/server/Stream_TM_Packet_Provider/
sidebar: yes
---

Receives packets from <tt>tm</tt> streams and sends them to the processor for extraction of parameters.

This respects the root container defined as part of the <tt>streamConfig</tt> in `yamcs.yaml`.

### Class Name
{% javadoc 'org/yamcs/StreamTmPacketProvider' %}

### Configuration

This service is defined in <tt>etc/processor.yaml</tt>. Example:

<pre class="r header">processor.yaml</pre>
```yaml
realtime:
  services:
    - class: org.yamcs.StreamTmPacketProvider
      args:
        streams: ["tm_realtime", "tm_dump"]
```

### Configuration Options

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">streams</td>
    <td class="code">list of strings</td>
    <td><strong>Required.</strong> The streams to read.</td>
  </tr>
</table>
