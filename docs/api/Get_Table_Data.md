---
layout: default
permalink: /docs/api/Get_Table_Data/
sidebar: yes
---

Get the most recent data of a Yamcs table:

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
        <td>The maximum number of returned records per page. Choose this value too high and you risk hitting the maximum response size limit enforced by the server. Default <tt>100</tt></td>
    </tr>
    <tr>
        <td class="code">sort</td>
        <td class="code">array of strings</td>
        <td>
            <p>What column to sort results by. Prefix the column with <code>+</code> or <code>-</code> to specify the direction of the sort. The default direction is ascending: <code>+</code></p>
            <p>E.g. <tt>?sort=gentime,-rectime</tt></p>
        </td>
    </tr>
    <tr>
        <td class="code">pretty</td>
        <td class="code">bool</td>
        <td>Format the JSON result in a human readable manner</td>
    </tr>
</table>

The <tt>start</tt> and <tt>limit</tt> allow for simplistic pagination and should really be combined with <tt>sort</tt> for deterministic behaviour. Keep in mind that in-between two requests extra data may have been added to the table, causing a shift of the results. This generic stateless operation does not provide a reliable mechanism against that, so address this by overlapping your <tt>start</tt> parameter with rows of the previous query if you need to combine multiple pages. For example, here we overlap by 4:

    ?start=0&limit=50&sort=-gentime
    ?start=45&limit=50&sort=-gentime

### Response

<pre class="header">
Status: 200 OK
Link: <http://localhost:8090/api/.../data?page=2>; rel="next"
</pre>

{% highlight json %}
todo
{% endhighlight %}

### Protobuf

Response is of type `Archive.TableData`:

{% highlight nginx %}
message TableData {
  message TableRecord {
    repeated ColumnData column = 1;
  }
  repeated TableRecord record = 1;
}
{% endhighlight %}

Supporting definitions:

<pre class="r header">archive.proto</pre>

{% highlight nginx %}
message ColumnData {
  optional string name = 1;
  optional yamcs.Value value = 2;
}
{% endhighlight %}
