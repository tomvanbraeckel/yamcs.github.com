---
layout: default
permalink: /docs/http/Download_Completeness_Index/
sidebar: yes
---

Download the completeness index records for the given instance:

    GET /api/archive/:instance/indexes/completeness

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
  "id": {
    "name": "apid_1"
  },
  "first": "1522399433316",
  "last": "1522399433316",
  "num": 1,
  "info": "seqFirst: 0 seqLast: 0"
}{
  "id": {
    "name": "apid_1"
  },
  "first": "1522399433515",
  "last": "1522399433515",
  "num": 1,
  "info": "seqFirst: 0 seqLast: 0"
}{
  "id": {
    "name": "apid_1"
  },
  "first": "1522399433718",
  "last": "1522399433718",
  "num": 1,
  "info": "seqFirst: 0 seqLast: 0"
}
```

### Alternative Media Types

#### Protobuf

Use HTTP header:

    Accept: application/protobuf

The response is a stream of individual Protobuf messages delimited with a <tt>VarInt</tt>. Every message is of type:

{% proto yamcs.proto %}
message ArchiveRecord {
  required NamedObjectId id = 1;
  required int64 first = 2;
  required int64 last = 3;
  required int32 num = 4;
  optional string info = 5;
}
{% endproto %}
