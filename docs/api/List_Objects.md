---
layout: default
permalink: /docs/api/List_Objects/
sidebar: yes
---

List all objects from a bucket

    GET /api/buckets/:instance/:bucketName

<tt>_global</tt> can be used as instance name to list the objects from a bucket at the global level.
### Parameters

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">prefix</td>
    <td class="code">string</td>
    <td>List only objects whose name start with prefix</td>
  </tr>
</table> 


### Response

<pre class="header">Status: 200 OK</pre>
```json
{
  "objects": [{
    "name": "request-example-to-REST-Archive-CSV-API.txt",
    "created": "2018-05-28T08:25:19.809Z",
    "size": "869"
  }]
}
```


### Alternative Media Types

#### Protobuf

Use HTTP header:

    Accept: application/protobuf
    
Response is of type:

<pre class="r header"><a href="/docs/api/rest.proto/">rest.proto</a></pre>
```proto

message ObjectInfo {
  optional string name = 1;
  optional string created  = 2; //time in UTC format
  optional uint64 size  = 3; //size in bytes
  map<string, string> metadata = 4;
}

message ListObjectsResponse {
   repeated ObjectInfo objects = 2;
}
```
