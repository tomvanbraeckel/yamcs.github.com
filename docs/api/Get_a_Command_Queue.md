---
layout: default
permalink: /docs/api/Get_an_Instance/
sidebar: yes
---

Get data on a Yamcs instance:

    GET /api/processors/:instance/:processor/cqueues/:name


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
        <td>format the JSON result in a human readable manner</td>
    </tr>
</table>

### Response

{% highlight json %}
{
  "instance" : "simulator",
  "processorName" : "realtime",
  "name" : "default",
  "state" : "ENABLED",
  "nbSentCommands" : 0,
  "nbRejectedCommands" : 0,
  "url" : "http://localhost:8090/api/processors/simulator/realtime/queues/default"
}
{% endhighlight %}

### Protobuf

Response is of type `Commanding.CommandQueueInfo`.

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
{% endhighlight %}

Supporting definitions:

<pre class="header">
    commanding.proto
</pre>

{% highlight nginx %}
enum QueueState {
  BLOCKED = 1;
  DISABLED = 2;
  ENABLED = 3;
}
{% endhighlight %}
