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

### Parameters

<table class="inline">
    <tr>
        <th>Name</th>
        <th>Type</th>
        <th>Description</th>
    </tr>
    <tr>
        <td class="code">pretty</td>
        <td class="code">bool</td>
        <td>Format the JSON result in a human readable manner</td>
    </tr>
</table>

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

Response is of type `Archive.TableInfo`.

{% highlight nginx %}
message TableInfo {
  optional string name = 1;
  repeated ColumnInfo keyColumn = 2;
  repeated ColumnInfo valueColumn = 3;
}
{% endhighlight %}

Supporting definitions:

<pre class="r header">archive.proto</pre>

{% highlight nginx %}
message ColumnInfo {
  optional string name = 1;
  optional string type = 2;
}
{% endhighlight %}
