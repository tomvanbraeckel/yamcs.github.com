---
layout: default
permalink: /docs/api/Get_Event_History/
sidebar: yes
---

Fetches events for the given Yamcs instance.

    GET /api/events/:instance


### Parameters

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">q</td>
    <td class="code">string</td>
    <td>The search keywords.</td>
  </tr>
  <tr>
    <td class="code">pretty</td>
    <td class="code">bool</td>
    <td>Format the JSON result in a human readable manner.</td>
  </tr>
</table>

Filters are specified in the request body, and should always include at least a `start` and a `stop` value. These are to be encoded in the internal Yamcs time format (use `TimeEncoding` from `yamcs-api`). We are likely to make this configurable in the future.

<table class="inline">
    <tr><th>Parameter</th><th>Description</th></tr>
     <tr><td>Body</td><td>Request body of type <code>Rest.RestDumpArchiveRequest</code></td></tr>
</table>


Protobuf definition:

{% highlight nginx %}
message RestDumpArchiveRequest {
  // Time specification (assumed Yamcs internal time)
  optional int64 start = 1;
  optional int64 stop = 2;
  
  //Alternative time specification as UTC strings in ISO8601 format
  optional string utcStart = 9;
  optional string utcStop = 10;

  // At least one of the following request types should be added
  optional yamcs.ParameterReplayRequest parameterRequest=3;
  optional yamcs.PacketReplayRequest packetRequest=4;
  optional yamcs.EventReplayRequest eventRequest=5;
  optional yamcs.CommandHistoryReplayRequest commandHistoryRequest=6;
  optional yamcs.PpReplayRequest ppRequest=7;

  // By default the response will be aggregated on the server and only when fully
  // built be sent to the client. This has a limitation of 1MB though.
  // You can circumvent this limitation by enabling the stream-option, see the
  // wiki for more details on this.
  optional bool stream=8;
}
{% endhighlight %}

### Optional Parameters

<table class="inline">
    <tr><th>Parameter</th><th>Description</th></tr>
     <tr><td>stream</td><td>In practice the Yamcs archive could be very big. Therefore, responses are by default limited to about 1MB. Anything above will generate a server error. If your client is expected to fetch more data than that, you should use this option.
<br>
Using this option, the response may contain multiple individually delimited JSON messages, therefore your JSON client does not need to wait for the full response before starting processing. For Protobuf clients, the individual messages are prefixed with their byte-size (Protobuf is not a self-delimiting message format).</td></tr>
</table>



### Response

Protobuf definition:

{% highlight nginx %}
message RestDumpArchiveResponse {
  repeated pvalue.ParameterData parameterData=2;
  repeated yamcs.TmPacketData packetData=3;
  repeated commanding.CommandHistoryEntry command=4;
  repeated yamcs.Event event=5;
  repeated pvalue.ParameterData ppData=6;
}
{% endhighlight %}

### Example

```
curl -XGET http://localhost:8090/simulator/api/archive -d '{"start": 1425686400,"stop": 1426636800,"commandHistoryRequest": {}}'
```
