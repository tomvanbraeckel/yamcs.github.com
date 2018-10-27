---
layout: default
permalink: /docs/http/List_Processors/
sidebar: yes
---

List all processors, across all Yamcs instances:

    GET /api/processors

List all processors for the given Yamcs instance:

    GET /api/processors/:instance


### Parameters

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">type</td>
    <td class="code">string</td>
    <td>Indicates the type of the processors to return. Can be either <tt>replay</tt>, <tt>realtime</tt> or <tt>all</tt>. Default: <tt>all</tt></td>
  </tr>
</table> 


### Response

<pre class="header">Status: 200 OK</pre>
```json
{
  "processor" : [ {
    "instance" : "simulator",
    "name" : "realtime",
    "type" : "realtime",
    "creator" : "system",
    "hasCommanding" : true,
    "state" : "RUNNING"
  } ]
}
```


### Alternative Media Types

#### Protobuf

Use HTTP header:

    Accept: application/protobuf
    
Response is of type:

<pre class="r header"><a href="{{ site.proto }}/rest/rest.proto">rest.proto</a></pre>
```proto
message ListProcessorsResponse {
  repeated yamcsManagement.ProcessorInfo processor = 1;
}
```
