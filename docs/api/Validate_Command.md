---
layout: default
permalink: /docs/api/Validate_Command/
sidebar: yes
---

```
POST /{yamcsInstance}/api/commanding/validator
```

### Required Parameters

<table class="inline">
    <tr><th>Parameter</th><th>Description</th></tr>
     <tr><td>Body</td><td>Request body of type <code>Rest.RestValidateCommandRequest</code></td></tr>
</table>

Protobuf definitions:

{% highlight nginx %}
message RestValidateCommandRequest {
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

<table class="inline">
    <tr><th>Parameter</th><th>Description</th></tr>
     <tr><td>pretty</td><td>If inserted in the request, the JSON result will be formatted in a human readable manner.</td></tr>
</table>

### Response

Empty response means the command was successfully validated.

If the command has a significance, a response is sent with type `Rest.RestValidateCommandResponse`. It contains the command significance.

Protobuf definitions:

{% highlight nginx %}
message RestValidateCommandResponse {
  repeated commanding.CommandSignificance commandsSignificance = 1;
}
{% endhighlight %}

{% highlight nginx %}
/* this message is sent as response to validate, in case the significance is defined for a commands*/
message CommandSignificance {
    enum Level {
        none = 1;
        watch = 2;
        warning = 3;
        distress = 4;
        critical = 5;
        severe = 6;
    };
   required int32 sequenceNumber = 1; //the sequence number of the command sent
   required Level consequenceLevel = 2;
   optional string reasonForWarning = 3;
}
{% endhighlight %}


### Example

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

