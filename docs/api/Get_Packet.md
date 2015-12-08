---
layout: default
permalink: /docs/api/Get_Packet/
sidebar: yes
---

Get a single packet:

    GET /api/archive/:instance/packets/:gentime/:seqnum

The gentime must be an exact match of the packet's generation time in ISO 8601 format. Example:

    /api/archive/simulator/packets/2015-10-20T06:47:02.000/808465467

### Response

<pre class="header">Status: 200 OK</pre>
{% highlight json %}
{
  "receptionTime" : 1447880235182,
  "packet" : "MDA0O1NVOzE7MDsyOzI7MjswOy0yMi43MTMwOysyNC44NTQwOzIwMTUvMTAvMjA7MDY6NDc6MDUuMDAwOzA7Ow==",
  "generationTime" : 1445323658000,
  "sequenceNumber" : 808465467
}
{% endhighlight %}

The binary inside the packet variable is encoded in Base64 format


### Alternative Media Types

#### Protobuf

Use HTTP header:

    Accept: application/protobuf
    
Response is of type:

<pre class="r header"><a href="/docs/api/yamcs.proto/">yamcs.proto</a></pre>
{% highlight proto %}
message TmPacketData {
  required int64 receptionTime = 1;
  required bytes packet = 2;
  optional int64 generationTime = 3;
  optional int32 sequenceNumber = 4;
  optional NamedObjectId id = 5;
}
{% endhighlight %}
