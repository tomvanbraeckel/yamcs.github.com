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

#### Response

<pre class="r header"><a href="/docs/api/rest.proto/">rest.proto</a></pre>
{% highlight proto %}
message ListStreamsResponse {
  repeated archive.StreamInfo stream = 1;
}
{% endhighlight %}
