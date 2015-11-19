---
layout: default
permalink: /docs/api/List_Parameter_Info/
sidebar: yes
---

List all parameters defined in the Mission Database for the given Yamcs instance:

    GET /api/mdb/:instance/parameters


List all parameters defined under the given namespace:

    GET /api/mdb/:instance/parameters/:namespace
    

### Parameters

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">q</td>
    <td class="code">string</td>
    <td>The search keywords.</td>
  </tr>
</table>

The `q` parameter supports searching on namespace or name. For example:

    /api/mdb/simulator/parameters?q=ccsds+yss&pretty 


### Response

<pre class="header">Status: 200 OK</pre>
{% highlight json %}
{
  "parameter" : [ {
    "name": "ccsds-apid",
    "qualifiedName" : "/YSS/ccsds-apid",
    "alias" : [ {
      "name" : "YSS_ccsds-apid",
      "namespace" : "MDB:OPS Name"
    }, {
      "name" : "ccsds-apid",
      "namespace" : "/YSS"
    } ],
    "type" : {
      "engType" : "integer",
      "dataEncoding" : "IntegerDataEncoding(sizeInBits:11, encoding:unsigned, defaultCalibrator:null byteOrder:BIG_ENDIAN)"
    },
    "dataSource" : "TELEMETERED",
    "url" : "http://localhost:8090/api/mdb/simulator/parameters/YSS/ccsds-apid"
  } ]
}
{% endhighlight %}


### Protobuf

#### Response

<pre class="r header"><a href="/docs/api/rest.proto/">rest.proto</a></pre>

{% highlight nginx %}
message ListParametersResponse {
  repeated mdb.ParameterInfo parameter = 1;
}
{% endhighlight %}
