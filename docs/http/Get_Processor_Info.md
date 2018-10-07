---
layout: default
permalink: /docs/http/Get_Processor_Info/
sidebar: yes
---

Get info on a specific Yamcs processor:

    GET /api/processors/:instance/:name
    

### Response

<pre class="header">
Status: 200 OK
</pre>
```json
{
  "instance" : "simulator",
  "name" : "realtime",
  "type" : "realtime",
  "creator" : "system",
  "hasCommanding" : true,
  "state" : "RUNNING"
}
```

### Alternative Media Types

#### Protobuf

Use HTTP header:

    Accept: application/protobuf
    
Response is of type:

<pre class="r header"><a href="/docs/http/yamcsManagement.proto/">yamcsManagement.proto</a></pre>
```proto
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
}
```
