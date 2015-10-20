---
layout: default
permalink: /docs/api/List_Parameters/
sidebar: yes
---

```
GET /{yamcsInstance}/api/mdb/parameters
```

### Required Parameters

<table class="inline">
    <tr><th>Parameter</th><th>Description</th></tr>
<tr><td>Body</td><td>Request body of type <code>Rest.RestListAvailableParametersRequest</code></td></tr>
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
message RestParameter {
  optional yamcs.NamedObjectId id=1;
  optional RestDataSource dataSource=2;
}
{% endhighlight %}

{% highlight nginx %}
message NamedObjectId {
  required string name=1;
  optional string namespace=2; 
}
{% endhighlight %}

{% highlight nginx %}
enum RestDataSource {
  TELEMETERED=0;
  DERIVED=1;
  CONSTANT=2;
  LOCAL=3;
  SYSTEM=4;
  COMMAND=5;
  COMMAND_HISTORY=6;
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


