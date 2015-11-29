---
layout: default
permalink: /docs/api/Download_Event_Index/
sidebar: yes
---

Download the index of stored events for the given instance:

    GET /api/archive/:instance/indexes/events

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

{% highlight json %}
{
  "id" : {
    "name" : "CustomAlgorithm"
  },
  "first" : 1448272052179,
  "last" : 1448272052241,
  "num" : 2
}{
  "id" : {
    "name" : "CustomAlgorithm"
  },
  "first" : 1448272057109,
  "last" : 1448272062209,
  "num" : 3
}{
  "id" : {
    "name" : "CustomAlgorithm"
  },
  "first" : 1448272067107,
  "last" : 1448272072206,
  "num" : 3
}
{% endhighlight %}

### Protobuf

#### Response

Individual Protobuf messages delimited with a <tt>varint</tt>. Every message is of type:

<pre class="r header"><a href="/docs/api/yamcs.proto/">yamcs.proto</a></pre>
{% highlight proto %}
message ArchiveRecord {
  required NamedObjectId id = 1;
  required int64 first = 2;
  required int64 last = 3;
  required int32 num = 4;
  optional string info = 5;
}
{% endhighlight %}
