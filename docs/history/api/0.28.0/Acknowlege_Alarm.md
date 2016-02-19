---
layout: default
version: 0.28.0
permalink: /docs/api/0.28.0/Acknowledge_Alarm/
sidebar: yes
---

### HTTP Post to Alarms

```
/{yamcsInstance}/api/alarms/acknowledge/(alarmId)/my/qualified/parameter/name
```


### Required Parameters

<table class="inline">
    <tr><th>Parameter</th><th>Description</th></tr>
     <tr><td>Body</td><td>When using Protobuf, send a request body of type `Rest.AcknowledgeAlarmRequest`. </td></tr>
</table>

Protobuf definitions:

```proto
message AcknowledgeAlarmRequest {
   optional string message = 1;
}
```

### Optional Parameters

<table class="inline">
    <tr><th>Parameter</th><th>Description</th></tr>
     <tr><td>pretty</td><td>If inserted in the request, the JSON result will be formatted in a human readable manner.</td></tr>
</table>

### Response



The response can be deserialized as `Rest.AcknowledgeAlarmResponse`.
Protobuf definition:

```proto
message AcknowledgeAlarmResponse {
   optional string errorMessage = 1;
}
```

### Example


For example to acknowledge the alarm from the previous example:

```
curl -XPOST http://localhost:8090/simulator/api/alarms/acknowledge/3/YSS/SIMULATOR/O2TankTemp?pretty -d '{"message": "bla bla"}'
```

If you get an empty response, the acknowledge was successful:
```json
{}
```

If the alarm could not be acknowledged, you get a message why that is. For instance:
```json
{
  "errorMessage" : "Parameter /YSS/SIMULATOR/O2TankTemp is not in state of alarm"
}
```


