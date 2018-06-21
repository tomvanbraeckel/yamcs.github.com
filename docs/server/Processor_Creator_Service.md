---
layout: default
permalink: /docs/server/Processor_Creator_Service/
sidebar: yes
---

Creates persistent processors owned by the system user.

### Class Name
[<tt>org.yamcs.ProcessorCreatorService</tt>](https://javadoc.io/page/org.yamcs/yamcs-core/latest/org/yamcs/ProcessorCreatorService.html)

### Configuration

This service is defined in <tt>etc/yamcs.(instance).yaml</tt>. Example from a typical deployment:

<pre class="r header">yamcs.simulator.yaml</pre>
```yaml
services:
  - class: org.yamcs.ProcessorCreatorService
    args:
      name: realtime
      type: realtime
```

### Configuration Options

<dl>
  <dt><tt>name</tt></dt>
  <dd><b>Required.</b> The name of the processor</dd>

  <dt><tt>type</tt></dt>
  <dd><b>Required.</b> The type of the processor</dd>

  <dt><tt>config</tt></dt>
  <dd>Configuration string to pass to the processor</dd>
</dl>
