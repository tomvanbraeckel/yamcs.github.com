---
layout: default
permalink: /docs/server/Software_Parameter_Manager/
sidebar: yes
---

Manages and provides software parameters.

### Class Name
[<tt>org.yamcs.parameter.SoftwareParameterManager</tt>](https://javadoc.io/page/org.yamcs/yamcs-core/latest/org/yamcs/parameter/SoftwareParameterManager.html)

### Configuration

This service is defined in <tt>etc/processor.yaml</tt>. Example:

<pre class="r header">processor.yaml</pre>
```yaml
realtime:
  services:
    - class: org.yamcs.parameter.SoftwareParameterManager
```
