---
layout: default
permalink: /docs/api/Acknowledge_Alarm/
sidebar: yes
---

```
POST /:instance/alarms/acknowledge/:alarmId/my/qualified/parameter/name
```


### Required Parameters

<table class="inline">
    <tr><th>Parameter</th><th>Description</th></tr>
     <tr><td>Body</td><td>When using Protobuf, send a request body of type <code>Rest.AcknowledgeAlarmRequest</code>. </td></tr>
</table>

Protobuf definitions:

{% highlight nginx %}
message AcknowledgeAlarmRequest {
   optional string message = 1;
}
{% endhighlight %}

### Optional Parameters

<table class="inline">
    <tr><th>Parameter</th><th>Description</th></tr>
     <tr><td>pretty</td><td>If inserted in the request, the JSON result will be formatted in a human readable manner.</td></tr>
</table>

### Response

The response can be deserialized as `Rest.AcknowledgeAlarmResponse`.
Protobuf definition:

{% highlight nginx %}
message AcknowledgeAlarmResponse {
   optional string errorMessage = 1;
}
{% endhighlight %}

### Example


For example to acknowledge the alarm from the previous example:

```
curl -XPOST http://localhost:8090/simulator/api/alarms/acknowledge/3/YSS/SIMULATOR/O2TankTemp?pretty -d '{"message": "bla bla"}'
```

If you get an empty response, the acknowledge was successful:
{% highlight json %}
{}
{% endhighlight %}

If the alarm could not be acknowledged, you get a message why that is. For instance:
{% highlight json %}
{
  "errorMessage" : "Parameter /YSS/SIMULATOR/O2TankTemp is not in state of alarm"
}
{% endhighlight %}


