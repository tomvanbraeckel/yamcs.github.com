---
layout: default
permalink: /docs/api/List_Processors/
sidebar: yes
---

List all processors, across all Yamcs instances:

    GET /api/processors

List all processors for the given Yamcs instance:

    GET /api/processors/:instance


### Parameters

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">type</td>
    <td class="code">string</td>
    <td>Indicates the type of the processors to return. Can be either <tt>replay</tt>, <tt>realtime</tt> or <tt>all</tt>. Default: <tt>all</tt></td>
  </tr>
</table> 


### Response

<pre class="header">Status: 200 OK</pre>
{% highlight json %}
{
  "processor" : [ {
    "instance" : "simulator",
    "name" : "realtime",
    "type" : "realtime",
    "creator" : "system",
    "hasCommanding" : true,
    "state" : "RUNNING",
    "url" : "http://localhost:8090/api/processors/simulator/realtime",
    "clientsUrl": "http://localhost:8090/api/processors/simulator/realtime/clients",
    "parametersUrl" : "http://localhost:8090/api/processors/simulator/realtime/parameters{/namespace}{/name}",
    "commandsUrl" : "http://localhost:8090/api/processors/simulator/realtime/commands{/namespace}{/name}",
    "commandQueuesUrl" : "http://localhost:8090/api/processors/simulator/realtime/cqueues{/name}",
    "alarmsUrl" : "http://localhost:8090/api/processors/simulator/realtime/alarms{/id}"
  } ]
}
{% endhighlight %}


### Protobuf

#### Response

<pre class="r header"><a href="/docs/api/rest.proto/">rest.proto</a></pre>
{% highlight nginx %}
message ListProcessorsResponse {
  repeated yamcsManagement.ProcessorInfo processor = 1;
}
{% endhighlight %}
