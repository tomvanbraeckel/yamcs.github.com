---
layout: default
permalink: /docs/server/Replay_Service/
sidebar: yes
---

Provides telemetry packets and processed parameters from the archive.

### Class Name
[<tt>org.yamcs.tctm.ReplayService</tt>](https://javadoc.io/page/org.yamcs/yamcs-core/latest/org/yamcs/tctm/ReplayService.html)

### Configuration

This service is defined in <tt>etc/processor.yaml</tt>. Example:

<pre class="r header">processor.yaml</pre>
```yaml
Archive:
  services:
    - class: org.yamcs.tctm.ReplayService
```

### Configuration Options

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">excludeParameterGroups</td>
    <td class="code">list of strings</td>
    <td>Parameter groups to exclude from being replayed.</td>
  </tr>
</table>
