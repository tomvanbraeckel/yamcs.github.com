---
layout: default
permalink: /docs/http/Get_MDB_Detail/
sidebar: yes
---

Get data on a the Mission Database for the given Yamcs instance:

    GET /api/mdb/:instance


### Response

<pre class="header">Status: 200 OK</pre>
```json
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
```

### Alternative Media Types

#### Java-serialized XtceDb

Use HTTP header:

    Accept: application/x-java-serialized-object
    
This returns a full java-serialized binary dump of the <tt>XtceDb</tt>. You will need a dependency on the LGPL <tt>yamcs-api</tt> jar if you want to interpret it.

#### Protobuf

Use HTTP header:

    Accept: application/protobuf
    
Response is of type:

<pre class="r header"><a href="{{ site.proto }}/yamcsManagement/yamcsManagement.proto">yamcsManagement.proto</a></pre>
```proto
message MissionDatabase {
  required string configName = 1;
  required string name = 2;
  optional string version = 3;
  repeated SpaceSystemInfo spaceSystem = 4;
}
```
