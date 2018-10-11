---
layout: default
permalink: /docs/server/Local_Parameter_Manager/
sidebar: yes
---

Manages and provides local parameters.

### Class Name
[<tt>org.yamcs.parameter.LocalParameterManager</tt>](https://www.yamcs.org/yamcs/javadoc/org/yamcs/parameter/LocalParameterManager.html)

### Configuration

This service is defined in <tt>etc/processor.yaml</tt>. Example:

<pre class="r header">processor.yaml</pre>
```yaml
realtime:
  services:
    - class: org.yamcs.parameter.LocalParameterManager
```
