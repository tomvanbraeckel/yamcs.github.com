---
layout: default
permalink: /docs/api/Get_MDB_Detail/
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
    
This will give you a full java-serialized binary dump of the <tt>XtceDb</tt>. You will need a dependency on the LGPL <tt>yamcs-api</tt> jar if you want to interpret it. In general it is recommended to use other REST operations where possible, but sometimes having access to the full <tt>XtceDb</tt> is just very convenient. The Packet Viewer for instance, uses the returned XtceDb to perform client-side processing. 

#### Protobuf

Use HTTP header:

    Accept: application/protobuf
    
Response is of type:

<pre class="r header"><a href="/docs/api/yamcsManagement.proto/">yamcsManagement.proto</a></pre>
```proto
message MissionDatabase {
  required string configName = 1;
  required string name = 2;
  optional string version = 3;
  repeated SpaceSystemInfo spaceSystem = 4;
}
```
