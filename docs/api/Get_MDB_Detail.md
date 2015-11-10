---
layout: default
permalink: /docs/api/Get_MDB_Detail/
sidebar: yes
---

Get data on a the Mission Database for the given Yamcs instance:

    GET /api/mdb/:instance


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
  "configName" : "landing",
  "name" : "",
  "spaceSystem" : [ {
    "name" : "YSS",
    "qualifiedName" : "/YSS",
    "version" : "1.2",
    "parameterCount" : 3,
    "containerCount" : 1,
    "commandCount" : 1,
    "sub" : [ {
      "name" : "SIMULATOR",
      "qualifiedName" : "/YSS/SIMULATOR",
      "version" : "1.0",
      "parameterCount" : 59,
      "containerCount" : 9,
      "commandCount" : 8,
      "history" : [ {
        "version" : "1.3",
        "date" : "21-June-2020",
        "message" : "modified this and that"
      } ]
    } ]
}
{% endhighlight %}

### Protobuf

Response is of type `YamcsManagement.MissionDatabase`.

{% highlight nginx %}
message MissionDatabase {
  required string configName = 1;
  required string name = 2;
  optional string version = 3;
  repeated SpaceSystemInfo spaceSystem = 4;
  optional string url = 5;
  optional string parametersUrl = 6;
  optional string containersUrl = 7;
  optional string commandsUrl = 8;
}
{% endhighlight %}

Supporting definitions:

<pre class="r header">yamcsManagement.proto</pre>

{% highlight nginx %}
message SpaceSystemInfo {
  optional string name = 1;
  optional string qualifiedName = 2;
  optional string shortDescription = 3;
  optional string longDescription = 4;
  optional string version = 5;
  optional int32 parameterCount = 6;
  optional int32 containerCount = 7;
  optional int32 commandCount = 8;
  repeated HistoryInfo history = 9;
  repeated SpaceSystemInfo sub = 10;
}

message HistoryInfo {
  optional string version = 1;
  optional string date = 2;
  optional string message = 3;
}
{% endhighlight %}
