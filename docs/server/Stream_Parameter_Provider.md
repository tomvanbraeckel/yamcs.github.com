---
layout: default
permalink: /docs/server/Stream_Parameter_Provider/
sidebar: yes
---

Provides parameters received from the configured <tt>param</tt> stream.

### Class Name
[<tt>org.yamcs.tctm.StreamParameterProvider</tt>](https://www.yamcs.org/yamcs/javadoc/index.html?org/yamcs/tctm/StreamParameterProvider.html)

### Configuration

This service is defined in <tt>etc/processor.yaml</tt>. Example:

<pre class="r header">processor.yaml</pre>
```yaml
realtime:
  services:
    - class: org.yamcs.tctm.StreamParameterProvider
      args:
        stream: "pp_realtime"
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
