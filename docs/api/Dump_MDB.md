---
layout: default
permalink: /docs/api/Dump_MDB/
sidebar: yes
---


### HTTP Post

```
/{yamcsInstance}/api/mdb/dump
```

### Required Parameters

### Optional Parameters

### Response

Return the entire dump of the mission database. This is a very bad method which we would like to make more RESTful and explorable in the future, but for now it returns a java-serialized dump of `org.yamcs.xtce.XtceDb` for the specified yamcs instance. You'll need a dependency on yamcs-xtce to interpret this dump.

### Example

```
curl -XGET http://localhost:8090/simulator/api/mdb/dump?pretty
```

{% highlight json %}
{
  "rawMdb": "<blob encoded as Base64>"
}
{% endhighlight %}
