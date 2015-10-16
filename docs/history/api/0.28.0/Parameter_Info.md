---
layout: default
version: 0.28.0
permalink: /docs/api/0.28.0/Parameter_Info/
sidebar: yes
---

### HTTP Post

```
/{yamcsInstance}/api/mdb/parameterInfo
```

### Required Parameters

<table class="inline">
    <tr><th>Parameter</th><th>Description</th></tr>
     <tr><td>Body</td><td>Request body of type `Rest.RestGetParameterInfoRequest`</td></tr>
</table>

Protobuff definitions:

{% highlight nginx %}
message RestGetParameterInfoRequest {
    repeated yamcs.NamedObjectId list = 1;
}
{% endhighlight %}

{% highlight nginx %}
message NamedObjectId {
  required string name=1;
  optional string namespace=2; 
}
{% endhighlight %}

### Optional Parameters

<table class="inline">
    <tr><th>Parameter</th><th>Description</th></tr>
     <tr><td>pretty</td><td>If inserted in the request, the JSON result will be formatted in a human readable manner.</td></tr>
</table>


### Response

Response is of type `Rest.RestGetParameterInfoResponse`.

Protobuff definitions:

{% highlight nginx %}
message RestGetParameterInfoResponse {
    repeated RestParameterInfo pinfo = 1;
}
{% endhighlight %}

{% highlight nginx %}
message RestParameterInfo {
    optional yamcs.NamedObjectId id = 1;
    optional RestNameDescription description = 2;
    optional RestParameterType type = 3;
    optional string dataSource = 4;
}
{% endhighlight %}

{% highlight nginx %}
message RestNameDescription {
    optional string qualifiedName = 1;
    optional string shortDescription = 2;
    optional string longDescription = 3;
    repeated yamcs.NamedObjectId aliases = 4;
}
{% endhighlight %}


{% highlight nginx %}
message RestParameterType {
    optional string engType = 1;
    optional string dataEncoding =2; //TODO
    repeated RestUnitType unitSet = 3; 
    optional RestAlarmInfo defaultAlarm = 4;
}
{% endhighlight %}

{% highlight nginx %}
message RestUnitType {
   optional string unit = 1;
}
{% endhighlight %}

{% highlight nginx %}
message RestAlarmInfo {
    optional int32 minViolations = 1;
    repeated RestAlarmRange staticAlarmRanges = 2;
}
{% endhighlight %}

{% highlight nginx %}
message RestAlarmRange {
   optional RestAlarmLevel level = 1; 
   optional double minInclusive = 2;
   optional double maxInclusive = 3; 
   optional string enumerationValue = 4;
}
{% endhighlight %}


### Example

Get information about a parameter:

```
curl -XGET 'http://localhost:8090/simulator/api/mdb/parameterInfo?pretty&name=SIMULATOR_ccsds-apid&namespace=MDB:OPS Name'
```

The result: **TBW**


Get information about a list of parameters:

```
curl -XGET http://localhost:8090/simulator/api/mdb/parameterInfo?pretty -d '{
    "list": [
     {"name": "SIMULATOR_ccsds-apid",
      "namespace": "MDB:OPS Name"}
    ]
}'
```
The result: **TBW**
