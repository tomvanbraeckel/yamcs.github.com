---
layout: default
permalink: /docs/api/Get_a_Command_Queue/
sidebar: yes
---

Get data on a Yamcs instance:

    GET /api/processors/:instance/:processor/cqueues/:name


### Response

{% highlight json %}
{
  "instance" : "simulator",
  "processorName" : "realtime",
  "name" : "default",
  "state" : "ENABLED",
  "nbSentCommands" : 0,
  "nbRejectedCommands" : 0,
  "url" : "http://localhost:8090/api/processors/simulator/realtime/cqueues/default"
}
{% endhighlight %}

### Protobuf

#### Response

<pre class="r header"><a href="/docs/api/commanding.proto/">commanding.proto</a></pre>
{% highlight proto %}
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
