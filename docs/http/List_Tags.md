---
layout: default
permalink: /docs/http/List_Tags/
sidebar: yes
---

List all tags for the given instance:

    GET /api/archive/:instance/tags

    
### Example

<pre class="header">
Status: 200 OK
</pre>

```json
{
  "tag" : [ {
    "id" : 1,
    "name" : "My annotation",
    "start" : 1449128432000,
    "stop" : 1449174255000,
    "description" : "blabla",
    "color" : "#ffc800"
  } ]
}
```


### Alternative Media Types

#### Protobuf

Use HTTP header:

    Accept: application/protobuf
    
Response is of type:

<pre class="r header"><a href="/docs/http/rest.proto/">rest.proto</a></pre>
```proto
message ListTagsResponse {
  repeated yamcs.ArchiveTag tag = 1;
}
```
