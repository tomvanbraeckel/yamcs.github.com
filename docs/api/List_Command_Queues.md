---
layout: default
permalink: /docs/api/List_Command_Queues/
sidebar: yes
---

List all command queues for the given processor:

    GET /api/processors/:instance/:processor/cqueues


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


### Response

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

Response body is of type `Rest.ListCommandQueuesResponse`

{% highlight nginx %}
message ListCommandQueuesResponse {
  repeated commanding.CommandQueueInfo queue = 1;
}
{% endhighlight %}

Supporting definitions:

<pre class="header">
  commanding.proto
</pre>

{% highlight nginx %}
message CommandQueueInfo {
  required string instance = 1;
  required string processorName = 2;
  required string name = 3;
  optional QueueState state = 4;
  required int32 nbSentCommands = 5;
  required int32 nbRejectedCommands = 6;
  optional int32 stateExpirationTimeS = 7;
  optional string url = 8;
}

enum QueueState {
  BLOCKED = 1;
  DISABLED = 2;
  ENABLED = 3;
}
{% endhighlight %}
