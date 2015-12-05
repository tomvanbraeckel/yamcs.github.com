---
layout: default
permalink: /docs/api/List_Links/
sidebar: yes
---

List all links:

    GET /api/links

List all links for the given Yamcs instance:

    GET /api/links/:instance 


### Response

<pre class="header">Status: 200 OK</pre>
{% highlight json %}
{
  "link" : [ {
    "instance" : "simulator",
    "name" : "tm1",
    "type" : "HkDataHandler",
    "spec" : "",
    "stream" : "tm_realtime",
    "disabled" : false,
    "status" : "OK",
    "dataCount" : 34598,
    "detailedStatus" : "reading files from /storage/yamcs-incoming/simulator/tm"
  } ]
}
{% endhighlight %}


### Protobuf

#### Response

<pre class="r header"><a href="/docs/api/rest.proto/">rest.proto</a></pre>
{% highlight proto %}
message ListLinkInfoResponse {
  repeated yamcsManagement.LinkInfo link = 1;
}
{% endhighlight %}
