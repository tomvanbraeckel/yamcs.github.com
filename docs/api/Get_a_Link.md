---
layout: default
permalink: /docs/api/Get_a_Link/
sidebar: yes
---

Get data on a specific link for the given Yamcs instance:

    GET /api/links/:instance/:name


### Response

<pre class="header">Status: 200 OK</pre>
{% highlight json %}
{
  "instance" : "simulator",
  "name" : "tm1",
  "type" : "HkDataHandler",
  "spec" : "",
  "stream" : "tm_realtime",
  "disabled" : false,
  "status" : "OK",
  "dataCount" : 34598,
  "detailedStatus" : "reading files from /storage/yamcs-incoming/simulator/tm"
}
{% endhighlight %}

### Protobuf

Response:

<pre class="r header"><a href="/docs/api/yamcsManagement.proto/">yamcsManagement.proto</a></pre>
{% highlight proto %}
message LinkInfo {
  required string instance = 1;
  required string name = 2;
  optional string type = 3;
  optional string spec = 4;
  optional string stream = 5;
  optional bool disabled = 6;
  optional string status = 7;
  optional int64 dataCount = 8;
  optional string detailedStatus = 9;
}
{% endhighlight %}
