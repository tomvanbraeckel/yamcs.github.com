---
layout: default
permalink: /docs/api/Edit_Processor/
sidebar: yes
---

Edit a processor:

    PATCH /api/processors/:instance/:name

<div class="hint">
  Only replay processors can be edited.
</div>


### Parameters

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">state</td>
    <td class="code">string</td>
    <td>The state this replay processor should be updated to. Either <tt>paused</tt>, <tt>running</tt> or <tt>closed</tt>.</td>
  </tr>
  <tr>
    <td class="code">seek</td>
    <td class="code">string</td>
    <td>The time where the processing needs to jump towards. Must be a date string in ISO 8601 format.</td>
  </tr>
  <tr>
    <td class="code">speed</td>
    <td class="code">string</td>
    <td>
        The speed of the processor. One of:
        <ul>
            <li><tt>afap</tt></li>
            <li>a speed factor relative to the original speed. Example: <tt>2x</tt></li>
            <li>a fixed delay value in milliseconds. Example: <tt>2000</tt></li>
        </ul>
    </td>
  </tr>
</table>

### Example

Pause the processor:

```json
{
  "state" : "paused"
}
```

Resume the processor, and set speed to 2.5x:

```json
{
  "state" : "running",
  "speed" : "2.5x"
}
```

Make processor move according to original speed:

```json
{
  "speed" : "1x"
}
```


### Alternative Media Types

#### Protobuf

Use these HTTP headers:

    Content-Type: application/protobuf
    Accept: application/protobuf
    
Request is of type:

<pre class="r header"><a href="/docs/api/rest.proto/">rest.proto</a></pre>
```proto
message EditProcessorRequest {
  optional string state = 1;
  optional string seek = 2;
  optional string speed = 3;
}
```
