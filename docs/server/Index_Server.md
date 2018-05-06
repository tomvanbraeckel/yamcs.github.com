---
layout: default
permalink: /docs/server/Index_Server/
sidebar: yes
---

Supports retrieval of archive indexes and tags.

### Configuration

This service is defined in <tt>etc/yamcs.(instance).yaml</tt>. Example from a typical deployment:

<pre class="r header">yamcs.simulator.yaml</pre>
```yaml
services:
  - org.yamcs.archive.IndexServer
```
