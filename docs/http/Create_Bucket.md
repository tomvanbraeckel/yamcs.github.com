---
layout: default
permalink: /docs/http/Create_Bucket/
sidebar: yes
---
Create a bucket:

    POST /api/buckets/:instance

<tt>_global</tt> can be used as instance name to create a bucket at the global level.


### Request Body
```json
{
  "name": "my_bucket"
}
```

### Alternative Media Types

#### Protobuf

Use these HTTP headers:

    Content-Type: application/protobuf
    Accept: application/protobuf
    
Request is of type:

{% proto rest/rest.proto %}
message CreateBucketRequest {
  optional string name = 1;
}
{% endproto %}