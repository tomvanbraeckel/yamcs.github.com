---
layout: default
permalink: /docs/server/System_Parameter_Provider/
sidebar: yes
---

Provides parameters received from the <tt>sys_param</tt> stream.

### Class Name
[<tt>org.yamcs.parameter.SystemParametersProvider</tt>](https://javadoc.io/page/org.yamcs/yamcs-core/latest/org/yamcs/parameter/SystemParametersProvider.html)

### Configuration

This service is defined in <tt>etc/processor.yaml</tt>. Example:

<pre class="r header">processor.yaml</pre>
```yaml
realtime:
  services:
    - class: org.yamcs.parameter.SystemParametersProvider
```
