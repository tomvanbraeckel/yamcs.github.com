---
layout: default
permalink: /docs/server/Index_Server/
sidebar: yes
---

Supports retrieval of archive indexes and tags.

### Class Name
[<tt>org.yamcs.archive.IndexServer</tt>](https://javadoc.io/page/org.yamcs/yamcs-core/latest/org/yamcs/archive/IndexServer.html)

### Configuration

This service is defined in <tt>etc/yamcs.(instance).yaml</tt>. Example from a typical deployment:

<pre class="r header">yamcs.simulator.yaml</pre>
```yaml
services:
  - class: org.yamcs.archive.IndexServer
```

### Configuration Options

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">tmIndexer</td>
    <td class="code">string</td>
    <td>
      Class name of a <a href="https://javadoc.io/page/org.yamcs/yamcs-core/latest/org/yamcs/archive/TmIndex.html">TmIndex</a> implementation. Default is <a href="https://javadoc.io/page/org.yamcs/yamcs-core/latest/org/yamcs/archive/CcsdsTmIndex.html"><tt>org.yamcs.archive.CcsdsTmIndex</tt></a> which applies CCSDS conventions.
    </td>
  </tr>
</table>
