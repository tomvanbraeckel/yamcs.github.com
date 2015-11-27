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

#### Response

<pre class="r header"><a href="/docs/api/rest.proto/">rest.proto</a></pre>
{% highlight proto %}
message ListTablesResponse {
  repeated archive.TableInfo table = 1;
}
{% endhighlight %}
