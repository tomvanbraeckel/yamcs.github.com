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
  <tr>
    <td class="code">delimiter</td>
    <td class="code">string</td>
    <td>
      Return only objects whose name do not contain the delimiter after the prefix. For the other objects, the response contains (in the prefix response parameter) the name truncated after the delimiter. Duplicates are omitted.
    </td>
  </tr>
</table> 

The parameters <tt>prefix</tt> and <tt>delimiter</tt> provide filtering capabilities. These work similar to Google Cloud Storage and Amazon S3.

The <tt>delimiter</tt> allows the list to work in a directory mode despite the object namespace being flat. For example if the delimiter is set to "/", then listing the bucket containing objects "a/b", "a/c", "d", "e" and "e/f" returns objects "d" and "e" and prefixes "a/" and "e/".


### Response

<pre class="header">Status: 200 OK</pre>
```json
{
  "prefix": [ "a/"],
  "object": [{
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
   repeated string prefix = 1;
   repeated ObjectInfo object = 2;
}
```
