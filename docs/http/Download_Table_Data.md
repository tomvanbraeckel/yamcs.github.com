---
layout: default
permalink: /docs/http/Download_Table_Data/
sidebar: yes
---

Download archived table data:

    GET /api/archive/:instance/downloads/tables/:table
    
<div class="hint">
This operation will possibly download a very large file. If you worry about size for your application, check out the support for <a href="/docs/http/List_Table_Data/">paged table data</a> instead.
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
        <td class="code">order</td>
        <td class="code">string</td>
        <td>The order of the returned results. Can be either <tt>asc</tt> or <tt>desc</tt>. Default: <tt>asc</tt></td>
    </tr>
    <tr>
        <td class="code">format</td>
        <td class="code">string</td>
        <td>If it is <tt>dump</tt>, the response will contain low level information that allows the data to be used to load the table (see below).</td>
    </tr>
</table>


### Response

The response will be a stream of individual table records or rows. When using Protobuf, every table record is delimited by its byte size. 

### Alternative Media Types

#### Protobuf

Use HTTP header:

    Accept: application/protobuf
    
If non dump format is requested, response is of type:

<pre class="r header"><a href="/docs/http/archive.proto/">archive.proto</a></pre>
```proto
message TableData {
  message TableRecord {
    repeated ColumnData column = 1;
  }
  repeated TableRecord record = 1;
}
```

If <tt>format=dump</tt> parameter is used, the response is a series of <tt>Row</tt>s, each <tt>Row</tt> being composed of a list of <tt>Cell</tt>s.

Each row has an optional associated list of <tt>ColumnInfo</tt> messages that define the table columns conainted in the row. The <ColumnInfo> message assigns an integer <tt>id</tt> for each column and the <tt>id</tt> is present in each cell belonging to that column (this is done in order to avoid sending the <tt>ColumnInfo</tt> with each <tt>Cell</tt>). The column id starts from 0 and are incremented with each new column found. The ids are only valid during one single dump.

The dumped data does not contain information on any table characteristics such as (primary) key, partitioning or other storage options.


<pre class="r header"><a href="/docs/http/table.proto/">table.proto</a></pre>
```proto
message ColumnInfo {
  optional uint32 id = 1;
  optional string name = 2;
  //one of the types defined in org.yamcs.yarch.DataType
  //INT, STRING, DOUBLE, PROTOBUF(x.y.z), etc
  optional string type = 3; 
}

message Cell {
   optional uint32 columnId = 1; 
   optional bytes data = 2;
}

message Row {
  //the column info is only present for new columns in a stream of Row messages
  repeated ColumnInfo column = 1; 
  repeated Cell cell = 2;
}
```


<div class="hint">
The following command line can be used to dump the content of a table in a gzipped compressed file:
<pre>yamcs -y yamcsUrl table dump tbl1 tbl2...</pre>

The corresponding command load command can be used to load the dump back into the table (or in another table):
<pre>yamcs -y yamcsUrl table load tbl1 tbl2...</pre>


</div>
