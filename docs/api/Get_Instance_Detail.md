---
layout: default
permalink: /docs/api/Get_Instance_Detail/
sidebar: yes
---

Get data on a Yamcs instance:

    GET /api/instances/:instance


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
        <td>Format the JSON result in a human readable manner</td>
    </tr>
</table>

### Response

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

Response is of type `YamcsManagement.YamcsInstance`.

{% highlight nginx %}
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

Supporting definitions:

<pre class="header">
    yamcsManagement.proto
</pre>

{% highlight nginx %}
message MissionDatabase {
  required string configName = 1; //this is the config section in mdb.yaml
  required string name = 2; //XTCE root SpaceSystem name
  optional string version = 3; //XTCE root SpaceSystem header version
  repeated SpaceSystemInfo spaceSystem = 4;
  optional string url = 5;
  optional string parametersUrl = 6;
  optional string containersUrl = 7;
  optional string commandsUrl = 8;
}

message SpaceSystemInfo {
  optional string name = 1;
  optional string qualifiedName = 2;
  optional string shortDescription = 3;
  optional string longDescription = 4;
  repeated SpaceSystemInfo sub = 5;
}

message ProcessorInfo {
  optional string instance = 1;
  optional string name = 2;
  optional string type = 3;
  optional string spec = 4;
  optional string creator = 5;
  optional bool hasCommanding = 6;
  optional ServiceState state = 7;
  optional yamcs.ReplayRequest replayRequest = 8;
  optional yamcs.ReplayStatus.ReplayState replayState = 9;
  optional string url = 10;
  optional string clientsUrl = 11;
  optional string parametersUrl = 12;
  optional string commandsUrl = 13;
  optional string commandQueuesUrl = 14;
  optional string alarmsUrl = 15;
}
{% endhighlight %}
