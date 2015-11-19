---
layout: default
permalink: /docs/api/List_Command_Queues/
sidebar: yes
---

List all command queues for the given processor:

    GET /api/processors/:instance/:processor/cqueues


### Response

<pre class="header">Status: 200 OK</pre>
{% highlight json %}
{
  "queue" : [ {
    "instance" : "simulator",
    "processorName" : "realtime",
    "name" : "default",
    "state" : "ENABLED",
    "nbSentCommands" : 0,
    "nbRejectedCommands" : 0,
    "url" : "http://localhost:8090/api/processors/simulator/realtime/queues/default"
  } ]
}
{% endhighlight %}


### Protobuf

#### Response

<pre class="r header"><a href="/docs/api/rest.proto/">rest.proto</a></pre>
{% highlight nginx %}
message ListCommandQueuesResponse {
  repeated commanding.CommandQueueInfo queue = 1;
}
{% endhighlight %}
