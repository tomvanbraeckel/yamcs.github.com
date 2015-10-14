---
layout: default
version: 0.28.0
permalink: /docs/api/0.28.0/Commanding/
sidebar: yes
---

### Validate a command `/commanding/validator`
Empty response means the command was successfully validated.

```
curl -XGET http://localhost:8090/simulator/api/commanding/validator?pretty -d '
  {
    "commands": [
      {
        "id": {"name": "/SIMULATOR/SIMULATOR/SWITCH_VOLTAGE_ON"},
        "arguments":[{"name":"voltage_num", "value": "5"}]
      }
    ]
  }'
```

{% highlight json %}
{
  "exception" : {
    "type" : "BadRequestException",
    "msg" : "Cannot assign value to voltage_num: Value 5 is not in the range required for the type IntegerDataType name:voltage_num sizeInBits:32 signed: false, validRange: [1,3], encoding: IntegerDataEncoding(sizeInBits:8, encoding:unsigned, defaultCalibrator:null byteOrder:BIG_ENDIAN)"
  }
}
{% endhighlight %}

### Send a command `/commanding/queue`
Will perform validation first, and if successful will queue the command for further dispatching. As soon as it's queued, you get back an empty JSON object `{}`. Clients are required to specify a unique `sequenceNumber` for every command. The unicity is not currently enforced by the server, since it's basically there to help the client, and not necessarily the server.

```
curl -XPOST http://localhost:8090/simulator/api/commanding/queue?pretty -d '
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
