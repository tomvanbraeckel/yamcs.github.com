---
layout: default
permalink: /docs/api/List_Queued_Commands/
sidebar: yes
---

List all queued command entries for the given command queue:

    GET /api/processors/:instance/:processor/cqueues/:name/entries


### Response

<pre class="header">Status: 200 OK</pre>
{% highlight json %}
{
  "entry" : [ {
    "instance" : "simulator",
    "processorName" : "realtime",
    "queueName" : "default",
    "cmdId" : {
      "generationTime" : 1448782973440,
      "origin" : "000349-WS.local",
      "sequenceNumber" : 5,
      "commandName" : "/YSS/SIMULATOR/SWITCH_VOLTAGE_OFF"
    },
    "source" : "SWITCH_VOLTAGE_OFF(voltage_num: 2)",
    "binary" : "GGTAAAAAAAAAAABqAAAAAgI=",
    "username" : "anonymous",
    "generationTime" : 1448782973440,
    "uuid" : "3e867111-048a-4343-b195-47ba07d07093"
  } ]
}
{% endhighlight %}


### Protobuf

#### Response

<pre class="r header"><a href="/docs/api/rest.proto/">rest.proto</a></pre>
{% highlight proto %}
message ListCommandQueueEntries {
  repeated commanding.CommandQueueEntry entry = 1;
}
{% endhighlight %}
