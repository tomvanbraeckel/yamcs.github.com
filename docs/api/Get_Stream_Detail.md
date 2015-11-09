---
layout: default
permalink: /docs/api/Get_Stream_Detail/
sidebar: yes
---

Get data on a Yamcs stream:

    GET /api/archive/:instance/streams/:name
    
<div class="hint">
    This is low-level API for those cases where access to an internal stream of Yamcs is wanted. It is recommended to use other API operations for any of the default built-in streams.
</div>

### Parameters

<table class="inline">
    <tr>
        <th>Name</th>
        <th>Type</th>
        <th>Description</th>
    </tr>
    <tr>
        <td class="code">pretty</td>
        <td class="code">bool</td>
        <td>Format the JSON result in a human readable manner</td>
    </tr>
</table>

### Response

{% highlight json %}
{
  "name" : "tm_realtime",
  "column" : [ {
    "name" : "gentime",
    "type" : "TIMESTAMP"
  }, {
    "name" : "seqNum",
    "type" : "INT"
  }, {
    "name" : "rectime",
    "type" : "TIMESTAMP"
  }, {
    "name" : "packet",
    "type" : "BINARY"
  } ]
}
{% endhighlight %}

### Protobuf

Response is of type `Archive.StreamInfo`.

{% highlight nginx %}
message StreamInfo {
  optional string name = 1;
  repeated ColumnInfo column = 2;
}
{% endhighlight %}

Supporting definitions:

<pre class="r header">archive.proto</pre>

{% highlight nginx %}
message ColumnInfo {
  optional string name = 1;
  optional string type = 2;
}
{% endhighlight %}
