---
layout: default
permalink: /docs/api/List_Instances/
sidebar: yes
---

List all configured Yamcs instances:

    GET /api/instances


### Response

<pre class="header">Status: 200 OK</pre>
{% highlight json %}
{
  "instance" : [ {
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
  } ]
}
{% endhighlight %}


### Protobuf

#### Response

<pre class="r header"><a href="/docs/api/rest.proto/">rest.proto</a></pre>
{% highlight nginx %}
message ListInstancesResponse {
  repeated yamcsManagement.YamcsInstance instance = 1;
}
{% endhighlight %}
