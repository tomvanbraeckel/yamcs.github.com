---
layout: default
permalink: /docs/api/List_Parameters/
sidebar: yes
---

### HTTP Post

```
/{yamcsInstance}/api/mdb/parameters
```

### Required Parameters

<table class="inline">
    <tr><th>Parameter</th><th>Description</th></tr>
<tr><td>Body</td><td>Request body of type `Rest.RestListAvailableParametersRequest`</td></tr>
</table>

Protobuf definitions:

{% highlight nginx %}
message RestListAvailableParametersRequest {
  repeated string namespaces=1; // if not available, all the namespaces
}
{% endhighlight %}

### Optional Parameters

<table class="inline">
    <tr><th>Parameter</th><th>Description</th></tr>
     <tr><td>pretty</td><td>If inserted in the request, the JSON result will be formatted in a human readable manner.</td></tr>
</table>

### Response

Protobuf definitions:

{% highlight nginx %}
message RestListAvailableParametersResponse {
  repeated RestParameter parameters=1;
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

Retrieve qualified parameter names:

```
curl -XGET http://localhost:8090/simulator/api/mdb/parameters?pretty
```

{% highlight json %}
{
  "ids" : [ {
    "name": "/YSS/SIMULATOR/ccsds-apid",
  }, {
    "name": "/YSS/SIMULATOR/packet-type",
  } ]
}
{% endhighlight %}



Retrieve parameter aliases for specific namespaces:

```
curl -XGET http://localhost:8090/simulator/api/mdb/parameters?pretty -d '{
  "namespaces": ["MDB:OPS Name"]
}'
```

{% highlight json %}
{
  "ids" : [ {
    "name": "SIMULATOR_ccsds-apid",
    "namespace": "MDB:OPS Name"
  } ]
}
{% endhighlight %}


