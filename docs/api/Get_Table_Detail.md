---
layout: default
permalink: /docs/api/Get_Table_Detail/
sidebar: yes
---

Get data on a Yamcs table:

    GET /api/archive/:instance/tables/:name

<div class="hint">
    This is low-level API for those cases where access to an internal key/value table of Yamcs is wanted. It is recommended to use other API operations for any of the default built-in tables.
</div>


### Response

{% highlight json %}
{
  "name" : "tm",
  "keyColumn" : [ {
    "name" : "gentime",
    "type" : "TIMESTAMP"
  }, {
    "name" : "seqNum",
    "type" : "INT"
  } ],
  "valueColumn" : [ {
    "name" : "rectime",
    "type" : "TIMESTAMP"
  }, {
    "name" : "packet",
    "type" : "BINARY"
  }, {
    "name" : "pname",
    "type" : "ENUM"
  } ]
}
{% endhighlight %}

### Protobuf

Response:

<pre class="r header">archive.proto</pre>
{% highlight nginx %}
message TableInfo {
  optional string name = 1;
  repeated ColumnInfo keyColumn = 2;
  repeated ColumnInfo valueColumn = 3;
}
{% endhighlight %}
