---
layout: default
permalink: /docs/api/Streams/
sidebar: yes
---

The `stream` resource type within the [[ WebSocket API ]] groups low-level publish/subscribe operations on [[ Yamcs Streams ]].

The documented operations work on one of the built-in streams (like `tm`, `tm_realtime`, `tm_dump`, `pp_realtime`, `cmdhist_realtime`, etc). Or, if your Yamcs deployment defines any other streams, they would work as well.

We recommend using the LGPL Java WebSocket client distributed as part of the yamcs-api jar, but for deeper understanding, this is the protocol:

### Subscribe to a Stream
Within the websocket request envelope use these values:
* request-type `stream`
* request `subscribe`
* data
    * With Protobuf: an object of type `Yamcs.StreamSubscribeRequest` where at least the `stream` name is filled in.
    * With JSON: an object literal where at least the `stream` key is set.

Here's a full request example in JSON-notation
```json
[1,1,3,{"stream": "subscribe", "data": {"stream": "tm_realtime"}}]
```

We are thinking of maybe adding other options, like a way to limit the data by filtering on one of the stream's columns, but this is pending an actual use case.

As a result of the above call you will get updates whenever anybody publishes data to the specified stream. With Protobuf, the data can be fetched with the `getStreamData()`-method on in the `WebSocketSubscriptionData` object. With JSON, you might see something like this sample output:

```json
[1,2,3]
[1,4,0,{"dt":"STREAM_DATA","data":{"stream":"tm_realtime","columnValue":[{"columnName":"gentime","value":{"type":6,"timestampValue":1438608491320}},{"columnName":"seqNum","value":{"type":3,"sint32Value":134283264}},{"columnName":"rectime","value":{"type":6,"timestampValue":1438608508323}},{"columnName":"packet","value":{"type":4,"binaryValue":"CAEAAAAPQuou2FJFAAAABOcAAAAAAA=="}}]}}]
[1,4,1,{"dt":"STREAM_DATA","data":{"stream":"tm_realtime","columnValue":[{"columnName":"gentime","value":{"type":6,"timestampValue":1438608491320}},{"columnName":"seqNum","value":{"type":3,"sint32Value":134283264}},{"columnName":"rectime","value":{"type":6,"timestampValue":1438608508323}},{"columnName":"packet","value":{"type":4,"binaryValue":"CAEAAAAPQuou2FJFAAAABOcAAAAAAA=="}}]}}]
```

In the case we were receiving some simulated data from the `tm_realtime` stream, this is a built-in stream with columns `gentime`, `rectime`, `seqNum` and `packet`. This last column is of binary format (it's the raw TM packet), which is why it is Base64-encoded in the JSON output.

Other streams would have different columns.

### Publish to a Stream
Within the websocket request envelope use these values:
* request-type `stream`
* request `publish`
* data
    * With Protobuf: an object of type `Yamcs.StreamData` where the `stream` key is set to the targeted stream, and where column-values are added for every column of that stream's definition.
    * With JSON: an object literal where the `stream` key is set to the targeted stream, and where `columnValue` is an array of `columnName`-`value` literals.

    The provided type has to match the type of the actual stream's definition.

Here's a full publish-request to the `tm_realtime`-stream in JSON-notation. Notice the similarities with the return type on the subscribe-operation.

```json
[1,1,3,{"stream":"publish","data":{"stream":"tm_realtime","columnValue":[{"columnName":"gentime","value":{"type":6,"timestampValue":1438608491320}},{"columnName":"seqNum","value":{"type":3,"sint32Value":134283264}},{"columnName":"rectime","value":{"type":6,"timestampValue":1438608508323}},{"columnName":"packet","value":{"type":4,"binaryValue":"CAEAAAAPQuou2FJFAAAABOcAAAAAAA=="}}]}}]
```

As as result of the above call the server will write that data to the requested stream (hence notifying anybody that might be subscribed to that stream), and return with just an empty ACK:

```json
[1,2,3]
```
