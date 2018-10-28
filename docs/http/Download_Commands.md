---
layout: default
permalink: /docs/http/Download_Commands/
sidebar: yes
---

Download command history:

    GET /api/archive/:instance/downloads/commands
    
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
        <td>Filter the lower bound of the command's generation time. Specify a date string in ISO 8601 format. This bound is inclusive.</td>
    </tr>
    <tr>
        <td class="code">stop</td>
        <td class="code">string</td>
        <td>Filter the upper bound of the command's generation time. Specify a date string in ISO 8601 format. This bound is exclusive.</td>
    </tr>
    <tr>
        <td class="code">order</td>
        <td class="code">string</td>
        <td>The order of the returned results. Can be either <tt>asc</tt> or <tt>desc</tt>. Default: <tt>asc</tt></td>
    </tr>
</table>


### Response

The response will be a stream of self-standing command history records.

### Alternative Media Types


#### Protobuf

Use HTTP header:

    Accept: application/protobuf

The response is a stream of individual Protobuf messages delimited by a <tt>VarInt</tt>. Messages are of type:

{% proto commanding/commanding.proto %}
message CommandHistoryAttribute {
  optional string name = 1;
  optional yamcs.Value value = 2;
  optional int64 time = 3;
}

message CommandHistoryEntry {
  required CommandId commandId = 1;
  repeated CommandHistoryAttribute attr = 3;
}
{% endproto %}
