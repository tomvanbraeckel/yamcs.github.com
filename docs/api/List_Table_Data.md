---
layout: default
permalink: /docs/api/List_Table_Data/
sidebar: yes
---

List the most recent data of a Yamcs table:

    GET /api/archive/:instance/tables/:table/data

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
        <td class="code">cols</td>
        <td class="code">array of strings</td>
        <td>
            The columns to be included in the result. Both these notations are accepted:
            <ul>
                <li><tt>?cols=rectime,gentime,pname</tt></li>
                <li><tt>?cols[]=rectime&cols[]=gentime&cols[]=pname</tt></li>
            </ul>
            If unspecified, all table and/or additional tuple columns will be included.
        </td>
    </tr>
    <tr>
        <td class="code">start</td>
        <td class="code">integer</td>
        <td>The zero-based row number at which to start outputting results. Default: <tt>0</tt></td>
    </tr>
    <tr>
        <td class="code">limit</td>
        <td class="code">integer</td>
        <td>The maximum number of returned records per page. Choose this value too high and you risk hitting the maximum response size limit enforced by the server. Default: <tt>100</tt></td>
    </tr>
    <tr>
        <td class="code">order</td>
        <td class="code">string</td>
        <td>The direction of the sort. Sorting is always done on the key of the table. Can be either <tt>asc</tt> or <tt>desc</tt>. Default: <tt>desc</tt></td>
    </tr>
</table>

The <tt>start</tt> and <tt>limit</tt> allow for pagination. Keep in mind that in-between two requests extra data may have been added to the table, causing a shift of the results. This generic stateless operation does not provide a reliable mechanism against that, so address it by overlapping your <tt>start</tt> parameter with rows of the previous query. In this example we overlap by 4:

    ?start=0&limit=50&order=desc
    ?start=45&limit=50&order=desc

### Response

<pre class="header">
Status: 200 OK
</pre>

{% highlight json %}
{
  "record" : [ {
    "column" : [ {
      "name" : "gentime",
      "value" : {
        "type" : "TIMESTAMP",
        "timestampValue" : 1446650363464
      }
    }, {
      "name" : "pname",
      "value" : {
        "type" : "STRING",
        "stringValue" : "/YSS/SIMULATOR/FlightData"
      }
    } ]
  }, {
    "column" : [ {
      "name" : "gentime",
      "value" : {
        "type" : "TIMESTAMP",
        "timestampValue" : 1446650363667
      }
    }, {
      "name" : "pname",
      "value" : {
        "type" : "STRING",
        "stringValue" : "/YSS/SIMULATOR/FlightData"
      }
    } ]
  } ]
}
{% endhighlight %}

### Protobuf

#### Response

<pre class="r header"><a href="/docs/api/archive.proto/">archive.proto</a></pre>
{% highlight nginx %}
message TableData {
  message TableRecord {
    repeated ColumnData column = 1;
  }
  repeated TableRecord record = 1;
}
{% endhighlight %}
