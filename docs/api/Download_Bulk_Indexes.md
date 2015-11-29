---
layout: default
permalink: /docs/api/Download_Bulk_Indexes/
sidebar: yes
---

Download multiple indexes at the same time for the given instance:

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

{% highlight json %}
{
  "instance" : "simulator",
  "records" : [ {
    "id" : {
      "name" : "/YSS/SIMULATOR/Power"
    },
    "first" : 1448272059406,
    "last" : 1448272084398,
    "num" : 5
  }, {
    "id" : {
      "name" : "/YSS/SIMULATOR/Power"
    },
    "first" : 1448823600003,
    "last" : 1448824423242,
    "num" : 133
  } ],
  "type" : "histogram",
  "tableName" : "tm"
}{
  "instance" : "simulator",
  "records" : [ {
    "id" : {
      "name" : "/YSS/SIMULATOR/SWITCH_VOLTAGE_OFF"
    },
    "first" : 1448731973739,
    "last" : 1448731973739,
    "num" : 1
  }, {
    "id" : {
      "name" : "/YSS/SIMULATOR/SWITCH_VOLTAGE_ON"
    },
    "first" : 1448791891823,
    "last" : 1448791891823,
    "num" : 1
  } ],
  "type" : "histogram",
  "tableName" : "cmdhist"
}
{% endhighlight %}

### Protobuf

#### Response

Individual Protobuf messages delimited with a <tt>varint</tt>. Every message is of type:

<pre class="r header"><a href="/docs/api/yamcs.proto/">yamcs.proto</a></pre>
{% highlight proto %}
message IndexResult {
  required string instance = 1;
  repeated ArchiveRecord records = 2;
  //type can be histogram or completeness
  optional string type = 3;
  //if type=histogram, the tableName is the table for which the histogram is sent
  optional string tableName = 4;
}
{% endhighlight %}
