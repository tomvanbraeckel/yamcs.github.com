---
layout: default
permalink: /docs/server/Processor_Creator_Service/
sidebar: yes
---

Creates persistent processors owned by the system user.

### Class Name
[<tt>org.yamcs.ProcessorCreatorService</tt>](https://www.yamcs.org/yamcs/javadoc/org/yamcs/ProcessorCreatorService.html)

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

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">name</td>
    <td class="code">string</td>
    <td><b>Required.</b> The name of the processor</td>
  </tr>
  <tr>
    <td class="code">type</td>
    <td class="code">string</td>
    <td><b>Required.</b> The type of the processor</td>
  </tr>
  <tr>
    <td class="code">config</td>
    <td class="code">string</td>
    <td>Configuration string to pass to the processor</td>
  </tr>
</table>
