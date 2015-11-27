---
layout: default
permalink: /docs/api/Get_Instance_Detail/
sidebar: yes
---

Get data on a Yamcs instance:

    GET /api/instances/:instance


### Response

<pre class="header">Status: 200 OK</pre>
{% highlight json %}
{
  "name" : "simulator",
  "missionDatabase" : {
    "configName" : "landing",
    "name" : "",
    "spaceSystem" : [ {
      "name" : "yamcs",
      "qualifiedName" : "/yamcs"
    }, {
      "name" : "YSS",
      "qualifiedName" : "/YSS",
      "sub" : [ {
        "name" : "SIMULATOR",
        "qualifiedName" : "/YSS/SIMULATOR"
      } ]
    }, {
      "name" : "GS",
      "qualifiedName" : "/GS"
    } ],
    "url" : "http://localhost:8090/api/mdb/simulator",
    "parametersUrl" : "http://localhost:8090/api/mdb/simulator/parameters{/namespace}{/name}",
    "containersUrl" : "http://localhost:8090/api/mdb/simulator/containers{/namespace}{/name}",
    "commandsUrl" : "http://localhost:8090/api/mdb/simulator/commands{/namespace}{/name}"
  },
  "processor" : [ {
    "name" : "realtime",
    "url" : "http://localhost:8090/api/processors/simulator/realtime",
    "clientsUrl" : "http://localhost:8090/api/processors/simulator/realtime/clients",
    "parametersUrl" : "http://localhost:8090/api/processors/simulator/realtime/parameters{/namespace}{/name}",
    "commandsUrl" : "http://localhost:8090/api/processors/simulator/realtime/commands{/namespace}{/name}",
    "commandQueuesUrl" : "http://localhost:8090/api/processors/simulator/realtime/cqueues{/name}"
  } ],
  "url" : "http://localhost:8090/api/instances/simulator",
  "clientsUrl" : "http://localhost:8090/api/instances/simulator{/processor}/clients",
  "eventsUrl" : "http://localhost:8090/api/instances/simulator{/processor}/events"
}
{% endhighlight %}

If an instance does not have web services enabled, it will be listed among the results, but none of its URLs will be filled in.

### Protobuf

Response:

<pre class="r header"><a href="/docs/api/yamcsManagement.proto/">yamcsManagement.proto</a></pre>

{% highlight proto %}
message YamcsInstance {
  required string name = 1;
  optional MissionDatabase missionDatabase = 3;
  repeated ProcessorInfo processor = 4;
  optional string url = 5;
  optional string clientsUrl = 6;
  optional string commandQueuesUrl = 7;
  optional string eventsUrl = 8;
}
{% endhighlight %}
