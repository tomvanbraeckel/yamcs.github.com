---
layout: default
permalink: /docs/api/List_Streams/
sidebar: yes
---

List all streams for the given instance:

    GET /api/archive/:instance/streams
    
<div class="hint">
    This is low-level API for those cases where access to the internal streams of Yamcs is wanted. It is recommended to use other API operations for any of the default built-in streams.
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
    <td>Format the JSON result in a human readable manner. Default: <tt>no</tt></td>
  </tr>
</table>

### Example

<pre class="header">Status: 200 OK</pre>
{% highlight json %}
{
  "stream" : [ {
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
  } ]
}
{% endhighlight %}

Note that this will only list the fixed columns of the stream. Tuples may always have extra columns.

### Protobuf
The response is of type:  `Rest.ListStreamsResponse`.

{% highlight nginx %}
message ListStreamsResponse {
  repeated archive.StreamInfo stream = 1;
}
{% endhighlight %}

Supporting definitions:

<pre class="r header">archive.proto</pre>
{% highlight nginx %}
message ColumnInfo {
  optional string name = 1;
  optional string type = 2;
}

message StreamInfo {
  optional string name = 1;
  repeated ColumnInfo column = 2;
}
{% endhighlight %}
