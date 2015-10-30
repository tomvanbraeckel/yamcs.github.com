---
layout: default
permalink: /docs/api/List_Processors/
sidebar: yes
---

List all processors, across all Yamcs instances:

    GET /api/processors

List all processors for the given Yamcs instance:

    GET /api/processors/:instance


### Parameters

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">type</td>
    <td class="code">string</td>
    <td>Indicates the type of the processors to return. Can be either <tt>replay</tt>, <tt>realtime</tt> or <tt>all</tt>. Default: <tt>all</tt></td>
  </tr>
  <tr>
    <td class="code">pretty</td>
    <td class="code">bool</td>
    <td>Format the JSON result in a human readable manner. Default: <tt>no</tt></td>
  </tr>
</table> 


### Response

{% highlight json %}
{
  "processor" : [ {
    "instance" : "simulator",
    "name" : "realtime",
    "type" : "realtime",
    "creator" : "system",
    "hasCommanding" : true,
    "state" : "RUNNING",
    "url" : "http://localhost:8090/api/processors/simulator/realtime",
    "parametersUrl" : "http://localhost:8090/api/processors/simulator/realtime/parameters{/namespace}{/name}",
    "commandsUrl" : "http://localhost:8090/api/processors/simulator/realtime/commands{/namespace}{/name}",
    "commandQueuesUrl" : "http://localhost:8090/api/processors/simulator/realtime/cqueues{/name}",
    "alarmsUrl" : "http://localhost:8090/api/processors/simulator/realtime/alarms{/id}"
  } ]
}
{% endhighlight %}


### Protobuf

Response body is of type `Rest.ListProcessorsResponse`:

{% highlight nginx %}
message ListProcessorsResponse {
  repeated yamcsManagement.ProcessorInfo processor = 1;
}
{% endhighlight %}

Supporting definitions:

<pre class="header">yamcsManagement.proto</pre>

{% highlight nginx %}
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
  optional string url = 10;
  optional string parametersUrl = 11;
  optional string commandsUrl = 12;
  optional string commandQueuesUrl = 13;
  optional string alarmsUrl = 14;
}
{% endhighlight %}


<pre class="header">yamcs.proto</pre>

{% highlight nginx %}
message ReplayRequest {
  //time specification
  optional int64 start = 1;
  optional int64 stop = 2;

  //alternative time specification: ISO 8061 time of shape 2012-11-03T07:36:33.323 (no timezone!)
  optional string utcStart = 13;
  optional string utcStop = 14;

  //what should happen at the end of the replay
  optional EndAction endAction = 3[default=QUIT];

  //how fast the replay should go
  optional ReplaySpeed speed = 4;

  // At least one of the following request types should be added
  optional ParameterReplayRequest parameterRequest = 8;
  optional PacketReplayRequest packetRequest = 9;
  optional EventReplayRequest eventRequest = 10;
  optional CommandHistoryReplayRequest commandHistoryRequest = 11;
  optional PpReplayRequest ppRequest = 12;
}

message ParameterReplayRequest {
  repeated NamedObjectId nameFilter = 1; // At least 1 filter is required
  optional bool sendRaw = 2[default=false];
  optional bool performMonitoring = 3[default=false]; //i.e. out of limit checking
}

message PacketReplayRequest {
  // No filter, means all packets for which privileges exist, are sent
  repeated NamedObjectId nameFilter = 1;
}

message EventReplayRequest {
}

message CommandHistoryReplayRequest {
}

message PpReplayRequest {
  repeated string groupNameFilter = 1; // At least 1 filter is required
}

message ReplayStatus {
   enum ReplayState {
     INITIALIZATION = 0; // just at the beginning or when the replay request (start, stop or packet selection) changes
     RUNNING = 1;
     STOPPED = 2; //the replay has reached the end with the endaction stop
     ERROR = 3;   //the replay stopped due to an error.
     PAUSED = 4;
     CLOSED = 5; //the replay is finished and closed
  }
  required ReplayState state = 1;
  optional ReplayRequest request = 2; //this is send only when answering getReplayStatus
  optional string errorMessage = 3; //in case state is ERROR
}

message ReplaySpeed {
  enum ReplaySpeedType {
    AFAP = 1;
    FIXED_DELAY = 2;
    REALTIME = 3;
  }
  required ReplaySpeedType type = 1;
  optional float param = 2;
}
{% endhighlight %}
