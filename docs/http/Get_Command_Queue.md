---
layout: default
permalink: /docs/http/Get_Command_Queue/
sidebar: yes
---

Get data on a command queue:

    GET /api/processors/:instance/:processor/cqueues/:name


### Response

```json
{
  "instance" : "simulator",
  "processorName" : "realtime",
  "name" : "default",
  "state" : "BLOCKED",
  "nbSentCommands" : 0,
  "nbRejectedCommands" : 0,
  "entry" : [ {
    "instance" : "simulator",
    "processorName" : "realtime",
    "queueName" : "default",
    "cmdId" : {
      "generationTime" : 1448782973440,
      "origin" : "000349-WS.local",
      "sequenceNumber" : 5,
      "commandName" : "/YSS/SIMULATOR/SWITCH_VOLTAGE_OFF"
    },
    "source" : "SWITCH_VOLTAGE_OFF(voltage_num: 2)",
    "binary" : "GGTAAAAAAAAAAABqAAAAAgI=",
    "username" : "anonymous",
    "generationTime" : 1448782973440,
    "uuid" : "3e867111-048a-4343-b195-47ba07d07093"
  } ]
}
```

### Alternative Media Types

#### Protobuf

Use HTTP header:

    Accept: application/protobuf
    
Response is of type:

<pre class="r header"><a href="{{ site.proto }}/commanding/commanding.proto">commanding.proto</a></pre>
```proto
message CommandQueueInfo {
  required string instance = 1;
  required string processorName = 2;
  required string name = 3;
  optional QueueState state = 4;
  required int32 nbSentCommands = 5;
  required int32 nbRejectedCommands = 6;
  optional int32 stateExpirationTimeS = 7;
}
```
