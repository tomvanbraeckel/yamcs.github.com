---
layout: default
permalink: /docs/api/Management_Updates/
sidebar: yes
---

The `management` resource type within the WebSocket API groups general Yamcs info that does not fit under a specific other resource type.

We recommend using the LGPL Java WebSocket client distributed as part of the yamcs-api jar, but if that is not an option, this is the protocol:

### Subscribe to Management Updates
Within the websocket request envelope use these values:
* request-type `management`
* request `subscribe`

This will make your web socket connection receive updates on the following Yamcs data types (aka `ProtoDataType`):

##### CLIENT_INFO
Updates on a client that is or was connected to Yamcs. Directly after sending a `management/subscribe` request, you will also get an update for all the clients that are connected at that point. As soon as a client is disconnected, you will also get an update on that.

Here's example output in JSON (with Protobuf, there's an applicable getter in the `WebSocketSubscriptionData`), where there are two anonymous clients connected to a non-secured deployment of Yamcs:

{% highlight json %}
[1,2,3]
[1,4,1,{"dt":"CLIENT_INFO","data":{"instance":"simulator","id":1,"username":"unknown","applicationName":"Unknown","processorName":"realtime","state":0,"currentClient":false}}]
[1,4,2,{"dt":"CLIENT_INFO","data":{"instance":"simulator","id":3,"username":"unknown","applicationName":"Unknown","processorName":"realtime","state":0,"currentClient":true}}]
{% endhighlight %}

After the empty initial ACK, we receive two data messages, one for each connected client at that point. Notice the `currentClient` field which indicates whether this client info concerns your own web socket session. The `state` field indicates either CONNECTED (0) or DISCONNECTED (1). In case the other use would close its connection, we would thus get an update on that too.

##### PROCESSOR_INFO
Updates on the lifecycle of Yamcs TM/TC processors. Directly after sending a `management/subscribe` request, you will also get an update for all the processors at that point.

Here's an example output in JSON (with Protobuf, there's an applicable getter in the `WebSocketSubscriptionData`), where there is just one processor `realtime`.

{% highlight json %}
[1,2,3]
[1,4,0,{"dt":"PROCESSOR_INFO","data":{"instance":"simulator","name":"realtime","type":"realtime","creator":"system","hasCommanding":true,"state":2}}]
{% endhighlight %}

##### PROCESSING_STATISTICS
General statistics on processors. For every high-level packet, shows you the the current processing time, an increasing data count, and many more info. Updates on this data type are a bit noisier than the client_info/processor_info updates, so we might decide to move this out to a different subscription request in the future.

Here's an example output in JSON (with Protobuf, there's an applicable getter in the `WebSocketSubscriptionData`):

{% highlight json %}
[1,4,3,{"dt":"PROCESSING_STATISTICS","data":{"instance":"simulator","yProcessorName":"realtime","tmstats":[{"packetName":"RCS","receivedPackets":2378,"lastReceived":1438235693322,"lastPacketTime":1438235676320,"subscribedParameterCount":12},{"packetName":"FlightData","receivedPackets":73718,"lastReceived":1438235693321,"lastPacketTime":1438235676320,"subscribedParameterCount":15},{"packetName":"ccsds-default","receivedPackets":2378,"lastReceived":1438235693322,"lastPacketTime":1438235676320,"subscribedParameterCount":3},{"packetName":"Power","receivedPackets":2378,"lastReceived":1438235693322,"lastPacketTime":1438235676320,"subscribedParameterCount":12},{"packetName":"DHS","receivedPackets":2378,"lastReceived":1438235693322,"lastPacketTime":1438235676320,"subscribedParameterCount":9}],"lastUpdated":1438235657322}}]
[1,4,4,{"dt":"PROCESSING_STATISTICS","data":{"instance":"simulator","yProcessorName":"realtime","tmstats":[{"packetName":"RCS","receivedPackets":2378,"lastReceived":1438235693322,"lastPacketTime":1438235676320,"subscribedParameterCount":12},{"packetName":"FlightData","receivedPackets":73723,"lastReceived":1438235694328,"lastPacketTime":1438235677324,"subscribedParameterCount":15},{"packetName":"ccsds-default","receivedPackets":2378,"lastReceived":1438235693322,"lastPacketTime":1438235676320,"subscribedParameterCount":3},{"packetName":"Power","receivedPackets":2378,"lastReceived":1438235693322,"lastPacketTime":1438235676320,"subscribedParameterCount":12},{"packetName":"DHS","receivedPackets":2378,"lastReceived":1438235693322,"lastPacketTime":1438235676320,"subscribedParameterCount":9}],"lastUpdated":1438235658328}}]
{% endhighlight %}


### Get Client-Info
Within the websocket request envelope use these values:
* request-type `management`
* request `getClientInfo`

This will return you a *one-time* data frame containing your own client info. The format is exactly the same as for the above described subscription updates.
