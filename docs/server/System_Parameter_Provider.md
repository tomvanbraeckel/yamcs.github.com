---
layout: default
permalink: /docs/server/System_Parameter_Provider/
sidebar: yes
---

Provides parameters received from the <tt>sys_param</tt> stream.

### Class Name
{% javadoc 'org/yamcs/parameter/SystemParametersProvider' %}

### Configuration

This service is defined in <tt>etc/processor.yaml</tt>. Example:

<pre class="r header">processor.yaml</pre>
```yaml
realtime:
  services:
    - class: org.yamcs.parameter.SystemParametersProvider
```
