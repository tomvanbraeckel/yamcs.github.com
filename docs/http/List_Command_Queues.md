---
layout: default
permalink: /docs/http/List_Command_Queues/
sidebar: yes
---

List all command queues for the given processor:

    GET /api/processors/:instance/:processor/cqueues


### Response

<pre class="header">Status: 200 OK</pre>
```json
{
  "queue" : [ {
    "instance" : "simulator",
    "processorName" : "realtime",
    "name" : "default",
    "state" : "ENABLED",
    "nbSentCommands" : 0,
    "nbRejectedCommands" : 0
  } ]
}
```


### Alternative Media Types

#### Protobuf

Use HTTP header:

    Accept: application/protobuf
    
Response is of type:

<pre class="r header"><a href="/docs/http/rest.proto/">rest.proto</a></pre>
```proto
message ListCommandQueuesResponse {
  repeated commanding.CommandQueueInfo queue = 1;
}
```
