---
layout: default
permalink: /docs/api/List_Tables/
sidebar: yes
---

List all tables for the given instance:

    GET /api/archive/:instance/tables
    
<div class="hint">
    This is low-level API for those cases where access to the internal key/value tables of Yamcs is wanted. It is recommended to use other API operations for any of the default built-in tables.
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
    <td>Format the JSON result in a human readable manner. Default: <tt>no</tt></td>
  </tr>
</table>

### Example

<pre class="header">
Status: 200 OK
</pre>

{% highlight json %}
{
  "table" : [ {
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
  } ]
}
{% endhighlight %}

Note that this will only list the fixed columns of the table. Tuples may always add extra value columns.

### Protobuf
The response is of type:  `Rest.ListTablesResponse`.

{% highlight nginx %}
message ListTablesResponse {
  repeated archive.TableInfo table = 1;
}
{% endhighlight %}

Supporting definitions:

<pre class="r header">archive.proto</pre>
{% highlight nginx %}
message ColumnInfo {
  optional string name = 1;
  optional string type = 2;
}

message TableInfo {
  optional string name = 1;
  repeated ColumnInfo keyColumn = 2;
  repeated ColumnInfo valueColumn = 3;
}
{% endhighlight %}
