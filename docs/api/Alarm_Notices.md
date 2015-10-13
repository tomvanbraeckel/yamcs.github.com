---
layout: default
permalink: /docs/api/Alarm_Notices/
sidebar: yes
---

The `alarms` resource type within the [[ WebSocket API ]] allows subscribing to alarm updates.

We recommend using the LGPL Java WebSocket client distributed as part of the yamcs-api jar, but if that is not an option, this is the protocol:

### Subscribe to Alarm Notices
Within the WebSocket request envelope use these values:
* request-type `alarms`
* request `subscribe`

This will make your web socket connection receive updates of the type `ProtoDataType.ALARM`.

Directly after you subscribe, you will also get the active set of alarms -- if any.

Here's example output in JSON (with Protobuf, there's an applicable getter in the `WebSocketSubscriptionData`). Notice how we are first getting an `ALARM` of type `1` (`ACTIVE`) that triggered somewhere before we connected, and only then a further update on that alarm of type `4` (`PVAL_UPDATED`) (because the parameter value was updated).

```json
[1,2,3]
[1,4,0,{"dt":"ALARM","data":{"id":0,"type":1,"triggerValue":{"id":{"name":"/YSS/SIMULATOR/O2TankTemp"},"rawValue":{"type":2,"uint32Value":227},"engValue":{"type":2,"uint32Value":227},"acquisitionTime":1440576556724,"generationTime":1440576539714,"acquisitionStatus":0,"processingStatus":true,"monitoringResult":21,"acquisitionTimeUTC":"2015-08-26T08:08:40.724","generationTimeUTC":"2015-08-26T08:08:23.714","watchLow":10.0,"watchHigh":12.0,"warningLow":30.0,"warningHigh":32.0,"distressLow":40.0,"distressHigh":42.0,"criticalLow":60.0,"criticalHigh":62.0,"severeLow":80.0,"severeHigh":82.0,"expirationTime":1440576558224,"expirationTimeUTC":"2015-08-26T08:08:42.224"},"mostSevereValue":{"id":{"name":"/YSS/SIMULATOR/O2TankTemp"},"rawValue":{"type":2,"uint32Value":227},"engValue":{"type":2,"uint32Value":227},"acquisitionTime":1440576556724,"generationTime":1440576539714,"acquisitionStatus":0,"processingStatus":true,"monitoringResult":21,"acquisitionTimeUTC":"2015-08-26T08:08:40.724","generationTimeUTC":"2015-08-26T08:08:23.714","watchLow":10.0,"watchHigh":12.0,"warningLow":30.0,"warningHigh":32.0,"distressLow":40.0,"distressHigh":42.0,"criticalLow":60.0,"criticalHigh":62.0,"severeLow":80.0,"severeHigh":82.0,"expirationTime":1440576558224,"expirationTimeUTC":"2015-08-26T08:08:42.224"},"currentValue":{"id":{"name":"/YSS/SIMULATOR/O2TankTemp"},"rawValue":{"type":2,"uint32Value":258},"engValue":{"type":2,"uint32Value":258},"acquisitionTime":1440576955780,"generationTime":1440576938777,"acquisitionStatus":0,"processingStatus":true,"monitoringResult":21,"acquisitionTimeUTC":"2015-08-26T08:15:19.780","generationTimeUTC":"2015-08-26T08:15:02.777","watchLow":10.0,"watchHigh":12.0,"warningLow":30.0,"warningHigh":32.0,"distressLow":40.0,"distressHigh":42.0,"criticalLow":60.0,"criticalHigh":62.0,"severeLow":80.0,"severeHigh":82.0,"expirationTime":1440576957280,"expirationTimeUTC":"2015-08-26T08:15:21.280"},"violations":65}}]
[1,4,1,{"dt":"ALARM","data":{"id":0,"type":4,"triggerValue":{"id":{"name":"/YSS/SIMULATOR/O2TankTemp"},"rawValue":{"type":2,"uint32Value":227},"engValue":{"type":2,"uint32Value":227},"acquisitionTime":1440576556724,"generationTime":1440576539714,"acquisitionStatus":0,"processingStatus":true,"monitoringResult":21,"acquisitionTimeUTC":"2015-08-26T08:08:40.724","generationTimeUTC":"2015-08-26T08:08:23.714","watchLow":10.0,"watchHigh":12.0,"warningLow":30.0,"warningHigh":32.0,"distressLow":40.0,"distressHigh":42.0,"criticalLow":60.0,"criticalHigh":62.0,"severeLow":80.0,"severeHigh":82.0,"expirationTime":1440576558224,"expirationTimeUTC":"2015-08-26T08:08:42.224"},"mostSevereValue":{"id":{"name":"/YSS/SIMULATOR/O2TankTemp"},"rawValue":{"type":2,"uint32Value":227},"engValue":{"type":2,"uint32Value":227},"acquisitionTime":1440576556724,"generationTime":1440576539714,"acquisitionStatus":0,"processingStatus":true,"monitoringResult":21,"acquisitionTimeUTC":"2015-08-26T08:08:40.724","generationTimeUTC":"2015-08-26T08:08:23.714","watchLow":10.0,"watchHigh":12.0,"warningLow":30.0,"warningHigh":32.0,"distressLow":40.0,"distressHigh":42.0,"criticalLow":60.0,"criticalHigh":62.0,"severeLow":80.0,"severeHigh":82.0,"expirationTime":1440576558224,"expirationTimeUTC":"2015-08-26T08:08:42.224"},"currentValue":{"id":{"name":"/YSS/SIMULATOR/O2TankTemp"},"rawValue":{"type":2,"uint32Value":280},"engValue":{"type":2,"uint32Value":280},"acquisitionTime":1440576962013,"generationTime":1440576945011,"acquisitionStatus":0,"processingStatus":true,"monitoringResult":21,"acquisitionTimeUTC":"2015-08-26T08:15:26.013","generationTimeUTC":"2015-08-26T08:15:09.011","watchLow":10.0,"watchHigh":12.0,"warningLow":30.0,"warningHigh":32.0,"distressLow":40.0,"distressHigh":42.0,"criticalLow":60.0,"criticalHigh":62.0,"severeLow":80.0,"severeHigh":82.0,"expirationTime":1440576963513,"expirationTimeUTC":"2015-08-26T08:15:27.513"},"violations":66}}]
```

### Unsubscribe
Within the WebSocket request envelope use these values:
* request-type `alarms`
* request `unsubscribe`

This will stop your WebSocket connection from getting further alarm updates.
