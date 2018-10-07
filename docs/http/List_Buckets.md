---
layout: default
permalink: /docs/http/List_Buckets/
sidebar: yes
---

List all buckets for the given Yamcs instance:

    GET /api/buckets/:instance 

<tt>_global</tt> can be used as instance name to list the buckets at the global level.

### Response

<pre class="header">Status: 200 OK</pre>
```json
{
  "buckets": [{
    "name": "my_bucket",
    "size": "1542391",
    "numObjects": 7
  }, {
    "name": "user.admin",
    "size": "1738",
    "numObjects": 2
  }]
}
```


### Alternative Media Types

#### Protobuf

Use HTTP header:

    Accept: application/protobuf
    
Response is of type:

<pre class="r header"><a href="/docs/http/rest.proto/">rest.proto</a></pre>
```proto
message BucketInfo {
  optional string name = 1;
  optional uint64 size  = 2; //total size in bytes of all objects in the bucket (metadata is not counted)
  optional uint32 numObjects  = 3; //number of objects in the bucket
}

message ListBucketsResponse {
  repeated BucketInfo buckets = 1;
}

```
