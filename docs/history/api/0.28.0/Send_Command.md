---
layout: default
version: 0.28.0
permalink: /docs/api/0.28.0/Send_Command/
sidebar: yes
---

### HTTP Post

```
/{yamcsInstance}/api/commanding/queue
```


### Required Parameters

<table class="inline">
    <tr><th>Parameter</th><th>Description</th></tr>
    <tr><td>Body</td><td>Request body of type `Rest.RestValidateCommandRequest`</td></tr>
</table>

Clients are required to specify a unique `sequenceNumber` for every command. The unicity is not currently enforced by the server, since it's basically there to help the client, and not necessarily the server.

Protobuff definitions:

{% highlight nginx %}
message RestSendCommandRequest {
  repeated RestCommandType commands=1;
}
{% endhighlight %}

{% highlight nginx %}
message RestCommandType {
  optional string origin=1;
  optional int32 sequenceNumber=2;
  optional yamcs.NamedObjectId id=3;
  repeated RestArgumentType arguments=4;
}
{% endhighlight %}

{% highlight nginx %}
message RestArgumentType {
  optional string name=1;
  optional string value=2;
}
{% endhighlight %}

### Optional Parameters

### Response

Will perform validation first, and if successful will queue the command for further dispatching. As soon as it's queued, you get back an empty JSON object `{}`.

### Example

```
curl -XPOST http://localhost:8090/simulator/api/commanding/queue -d '
  {
    "commands": [
      {
        "id": {"name": "/SIMULATOR/SIMULATOR/SWITCH_VOLTAGE_ON"},
        "arguments":[{"name":"voltage_num", "value": "2"}],
        "sequenceNumber": 1
      }
    ]
  }'
```
