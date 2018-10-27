---
layout: default
permalink: /docs/http/Download_Bulk_Indexes/
sidebar: yes
---

Download multiple indexes at the same time for the given instance:

    GET /api/archive/:instance/indexes

<div class="hint">
This operation will possibly download a very large file.
</div>

### Parameters

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">start</td>
    <td class="code">string</td>
    <td>The time at which to start retrieving index records.</td>
  </tr>
  <tr>
    <td class="code">stop</td>
    <td class="code">string</td>
    <td>The time at which to stop retrieving index records.</td> 
  </tr>
  <tr>
    <td class="code">filter</td>
    <td class="code">array of strings</td>
    <td>The type of indexes to retrieve. Choose out of <tt>tm</tt>, <tt>pp</tt>, <tt>events</tt>, <tt>commands</tt> or <tt>completeness</tt>. By default all indexes will be sent.</td> 
  </tr>
  <tr>
    <td class="code">packetname</td>
    <td class="code">array of strings</td>
    <td>Specify exact names for the TM packets for which you want to retrieve index records. Setting this parameter, automatically implies that <tt>tm</tt> is added to the filter.</td> 
  </tr>
</table>

Example request URI:

    /api/archive/simulator/indexes?filter=commands,events&packetname=/YSS/SIMULATOR/Power
    
### Example

You get back a sequence of consecutive self-standing JSON objects. Note that this JSON output can be useful for testing, but you probably want to use the Protobuf media type for decreased network traffic.

<pre class="header">
Status: 200 OK
</pre>

```json
{
  "instance" : "simulator",
  "records" : [ {
    "id" : {
      "name" : "/YSS/SIMULATOR/Power"
    },
    "first" : 1448272059406,
    "last" : 1448272084398,
    "num" : 5
  }, {
    "id" : {
      "name" : "/YSS/SIMULATOR/Power"
    },
    "first" : 1448823600003,
    "last" : 1448824423242,
    "num" : 133
  } ],
  "type" : "histogram",
  "tableName" : "tm"
}{
  "instance" : "simulator",
  "records" : [ {
    "id" : {
      "name" : "/YSS/SIMULATOR/SWITCH_VOLTAGE_OFF"
    },
    "first" : 1448731973739,
    "last" : 1448731973739,
    "num" : 1
  }, {
    "id" : {
      "name" : "/YSS/SIMULATOR/SWITCH_VOLTAGE_ON"
    },
    "first" : 1448791891823,
    "last" : 1448791891823,
    "num" : 1
  } ],
  "type" : "histogram",
  "tableName" : "cmdhist"
}
```

### Alternative Media Types

#### Protobuf request

This can be used when the list of packets is long and the GET URI would be larger than 4096 characters.

Use HTTP header:

    Content-Type: application/protobuf

The request is the same but without parameters. The parameters are encoded in the body and they are of type:

<pre class="r header"><a href="{{ site.proto }}/rest/rest.proto">rest.proto</a></pre>
```proto
message BulkGetIndexRequest {
  optional string start = 1;
  optional string stop = 2;
  repeated string filter = 3;
  repeated string packetname = 4;
}
```

#### Protobuf response

Use HTTP header:

    Accept: application/protobuf


The response is a stream of individual Protobuf messages delimited with a <tt>VarInt</tt>. Every message is of type:

<pre class="r header"><a href="{{ site.proto }}/yamcs.proto">yamcs.proto</a></pre>
```proto
message IndexResult {
  required string instance = 1;
  repeated ArchiveRecord records = 2;
  //type can be histogram or completeness
  optional string type = 3;
  //if type=histogram, the tableName is the table for which the histogram is sent
  optional string tableName = 4;
}
```

