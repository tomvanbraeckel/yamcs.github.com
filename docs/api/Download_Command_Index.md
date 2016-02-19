---
layout: default
permalink: /docs/api/Download_Command_Index/
sidebar: yes
---

Download the index of stored commands for the given instance:

    GET /api/archive/:instance/indexes/commands

<div class="hint">
This operation will possibly download a very large file.
</div>

### Parameters

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">start</td>
    <td class="code">string</td>
    <td>The time at which to start retrieving index records.</td>
  </tr>
  <tr>
    <td class="code">stop</td>
    <td class="code">string</td>
    <td>The time at which to stop retrieving index records.</td> 
  </tr>
</table>
    
### Example

You get back a sequence of consecutive self-standing JSON objects. Note that this JSON output can be useful for testing, but you probably want to use the Protobuf media type for decreased network traffic.

<pre class="header">
Status: 200 OK
</pre>

```json
{
  "id" : {
    "name" : "/YSS/SIMULATOR/SWITCH_VOLTAGE_OFF"
  },
  "first" : 1448731973739,
  "last" : 1448731973739,
  "num" : 1
}{
  "id" : {
    "name" : "/YSS/SIMULATOR/SWITCH_VOLTAGE_OFF"
  },
  "first" : 1448782973440,
  "last" : 1448782973440,
  "num" : 1
}{
  "id" : {
    "name" : "/YSS/SIMULATOR/SWITCH_VOLTAGE_OFF"
  },
  "first" : 1448783668726,
  "last" : 1448783674298,
  "num" : 3
}
```

### Alternative Media Types

#### Protobuf

Use HTTP header:

    Accept: application/protobuf

The response is a stream of individual Protobuf messages delimited with a <tt>VarInt</tt>. Every message is of type:

<pre class="r header"><a href="/docs/api/yamcs.proto/">yamcs.proto</a></pre>
```proto
message ArchiveRecord {
  required NamedObjectId id = 1;
  required int64 first = 2;
  required int64 last = 3;
  required int32 num = 4;
  optional string info = 5;
}
```
