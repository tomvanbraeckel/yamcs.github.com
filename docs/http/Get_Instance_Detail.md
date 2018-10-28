---
layout: default
permalink: /docs/http/Get_Instance_Detail/
sidebar: yes
---

Get data on a Yamcs instance:

    GET /api/instances/:instance


### Response

<pre class="header">Status: 200 OK</pre>
```json
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
    } ]
  },
  "processor" : [ {
    "name" : "realtime"
  } ]
}
```

If an instance does not have web services enabled, it will be listed among the results, but none of its URLs will be filled in.

### Alternative Media Types

#### Protobuf

Use HTTP header:

    Accept: application/protobuf
    
Response is of type:

{% proto yamcsManagement/yamcsManagement.proto %}
message YamcsInstance {
  required string name = 1;
  optional MissionDatabase missionDatabase = 3;
  repeated ProcessorInfo processor = 4;
}
{% endproto %}
