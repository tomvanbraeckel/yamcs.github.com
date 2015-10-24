---
layout: default
permalink: /docs/api/Get_an_Instance/
sidebar: yes
---

Get data on a Yamcs instance:

    GET /api/:instance


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
  "name" : "simulator",
  "missionDatabase" : {
    "configName" : "landing",
    "name" : ""
  },
  "url" : "http://localhost:8090/api/simulator",
  "alarmsUrl" : "http://localhost:8090/api/simulator/alarms",
  "parametersUrl" : "http://localhost:8090/api/simulator/parameters"
}
{% endhighlight %}

If an instance does not have web services enabled, it will be listed among the results, but none of its URLs will be filled in.

### Protobuf

Response is of type `Yamcs.YamcsInstance`.

{% highlight nginx %}
message YamcsInstance {
  required string name = 1;
  optional MissionDatabase missionDatabase = 3;
  optional string url = 4;
  optional string alarms_url = 5;
  optional string parameters_url = 6;
}
{% endhighlight %}

Supporting definitions:

<pre class="header">
    yamcs.proto
</pre>

{% highlight nginx %}
message MissionDatabase {
  required string configName = 1;
  required string name = 2;
  optional string version = 3;
}
{% endhighlight %}
