---
layout: default
permalink: /docs/api/Mission_Data_Base/0.28.0/
version: 0.28.0
sidebar: yes
---

### List Parameters `/mdb/parameters`
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



### Get parameter info `/mdb/parameterInfo`
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

### Dump the Mission Database `/mdb/dump`
Return the entire dump of the mission database. This is a very bad method which we would like to make more RESTful and explorable in the future, but for now it returns a java-serialized dump of `org.yamcs.xtce.XtceDb` for the specified yamcs instance. You'll need a dependency on yamcs-xtce to interpret this dump.

```
curl -XGET http://localhost:8090/simulator/api/mdb/dump?pretty
```

{% highlight json %}
{
  "rawMdb": "<blob encoded as Base64>"
}
{% endhighlight %}
