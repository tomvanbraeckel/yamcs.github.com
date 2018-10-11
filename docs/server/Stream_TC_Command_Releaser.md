---
layout: default
permalink: /docs/server/Stream_TC_Command_Releaser/
sidebar: yes
---

Sends commands to the configured <tt>tc</tt> stream.

### Class Name
[<tt>org.yamcs.StreamTcCommandReleaser</tt>](https://www.yamcs.org/yamcs/javadoc/org/yamcs/StreamTcCommandReleaser.html)

### Configuration

This service is defined in <tt>etc/processor.yaml</tt>. Example:

<pre class="r header">processor.yaml</pre>
```yaml
realtime:
  services:
    - class: org.yamcs.StreamTcCommandReleaser
      args:
        stream: "tc_realtime"
```

### Configuration Options

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">stream</td>
    <td class="code">string</td>
    <td><strong>Required.</strong> The stream to send commands to.</td>
  </tr>
</table>
