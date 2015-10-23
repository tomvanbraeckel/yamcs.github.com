---
layout: default
permalink: /docs/api/List_Instances/
sidebar: yes
---

List all configured Yamcs instances:

    GET /api/instances


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
  "instance" : [ {
    "name" : "simulator",
    "missionDatabase" : {
      "configName" : "landing",
      "name" : ""
    },
    "url" : "http://localhost:8090/api/simulator",
    "alarmsUrl" : "http://localhost:8090/api/simulator/alarms",
    "parametersUrl" : "http://localhost:8090/api/simulator/parameters"
  } ]
}
{% endhighlight %}

If an instance does not have web services enabled, it will be listed among the results, but none of its URLs will be filled in.

### Protobuf

Response is of type `Yamcs.ListInstancesResponse`.

{% highlight nginx %}
message ListInstancesResponse {
  repeated YamcsInstance instance = 1;
}
{% endhighlight %}

{% highlight nginx %}
message YamcsInstance {
  required string name = 1;
  optional MissionDatabase missionDatabase = 3;
  optional string url = 4;
  optional string alarms_url = 5;
  optional string parameters_url = 6;
}

{% endhighlight %}

{% highlight nginx %}
message MissionDatabase {
  required string configName = 1;
  required string name = 2;
  optional string version = 3;
}
{% endhighlight %}
