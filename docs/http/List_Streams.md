---
layout: default
permalink: /docs/http/List_Streams/
sidebar: yes
---

List all streams for the given instance:

    GET /api/archive/:instance/streams
    
{% hint %}
  This is low-level API for those cases where access to the internal streams of Yamcs is wanted. It is recommended to use other API operations for any of the default built-in streams.
{% endhint %}


### Example

<pre class="header">Status: 200 OK</pre>
```json
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
```

Note that this will only list the fixed columns of the stream. Tuples may always have extra columns.

### Alternative Media Types

#### Protobuf

Use HTTP header:

    Accept: application/protobuf
    
Response is of type:

{% proto rest/rest.proto %}
message ListStreamsResponse {
  repeated archive.StreamInfo stream = 1;
}
{% endproto %}
