---
layout: default
permalink: /docs/http/List_Instances/
sidebar: yes
---

List all configured Yamcs instances:

    GET /api/instances


### Response

<pre class="header">Status: 200 OK</pre>
```json
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
      } ]
    },
    "processor" : [ {
      "name" : "realtime"
    } ]
  } ]
}
```


### Alternative Media Types

#### Protobuf

Use HTTP header:

    Accept: application/protobuf
    
Response is of type:

{% proto rest/rest.proto %}
message ListInstancesResponse {
  repeated yamcsManagement.YamcsInstance instance = 1;
}
{% endproto %}
