---
layout: default
permalink: /docs/http/Packet_Updates/
sidebar: yes
---
The `packets` resource type within the WebSocket API allows subscribing to telemetry packets (containers) updates. 

Subscribe to packets received on a given stream:

```json
[ 1, 1, :seq, {
    "packets": "subscribe <stream_name>"    
} ]
```
Note: currently the subscription is performed at stream level. It is not possible to subscribe to the telemetry of a processor (but most of the time the telemetry in a processor will be coming from a stream).
Once the possibility to subscribe to a processor will be provided, there will be more operations like subscribing only to a specific container.

It is only possible to subscribe to one stream at a time.

### Example

Subscribe to tm_realtime stream:

```json
[ 1, 1, 789, {
    "packets": "subscribe tm_realtime"    
} ]
```

### Response

You first get an empty reply message confirming the positive receipt of your request:

```json
[ 1, 2, 789 ]
```
    
Further messages will be marked as type <tt>TM_PACKET</tt>. The data of the provided packets will be in TmPacketData format:

The response is a stream of self-standing <tt>VarInt</tt> delimited messages of type:

<pre class="r header"><a href="{{ site.proto }}/yamcs.proto">yamcs.proto</a></pre>
```proto
message TmPacketData {
  required int64 receptionTime = 1;
  required bytes packet = 2;
  optional int64 generationTime = 3;
  optional int32 sequenceNumber = 4;
  optional NamedObjectId id = 5;
}
```

Note: as the messages are received from a stream, the NamedObjectId (which is the identifier of the packet) will not be filled in. The future processor subscriptions may provide the packet identifiers.

### Unsubscribe

Unsubscribe from all currently subscribed packet:

```json
[ 1, 1, 790, { "packets": "unsubscribe" } ]
```

This will be confirmed with an empty reply message:

```json
[ 1, 2, 790 ]
```
