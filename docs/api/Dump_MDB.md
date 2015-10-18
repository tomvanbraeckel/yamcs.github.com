---
layout: default
permalink: /docs/api/Dump_MDB/
sidebar: yes
---

Returns the entire dump of the mission database. We recommend against using this method as we plan to make the entire mission database more RESTful and explorable in the future. 

```
GET /{yamcsInstance}/api/mdb/dump
```

### Required Parameters
None

### Optional Parameters
None

### Response
Java-serialized dump of `org.yamcs.xtce.XtceDb` for the specified yamcs instance. You will need a dependency on yamcs-xtce to interpret this dump.

### Example

```
curl -XGET http://localhost:8090/simulator/api/mdb/dump?pretty
```

{% highlight json %}
{
  "rawMdb": "<blob encoded as Base64>"
}
{% endhighlight %}
