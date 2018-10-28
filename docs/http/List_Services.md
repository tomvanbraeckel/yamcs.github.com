---
layout: default
permalink: /docs/http/List_Services/
sidebar: yes
---

List global services:

    GET /api/services/_global

List all services for the given Yamcs instance:

    GET /api/services/:instance 


### Response

<pre class="header">Status: 200 OK</pre>
```json
{
  "service" : [ {
    "instance" : "simulator",
    "name" : "org.yamcs.tctm.DataLinkInitialiser",
    "state" : "RUNNING"
  }, {
    "instance" : "simulator",
    "name" : "org.yamcs.archive.XtceTmRecorder",
    "state" : "RUNNING"
  }, {
    "instance" : "simulator",
    "name" : "org.yamcs.archive.FSEventDecoder",
    "state" : "RUNNING"
  }, {
    "instance" : "simulator",
    "name" : "org.yamcs.archive.PpRecorder",
    "state" : "RUNNING"
  }
  ...
  ]
}
```


### Alternative Media Types

#### Protobuf

Use HTTP header:

    Accept: application/protobuf
    
Response is of type:

{% proto rest/rest.proto %}
message ListServiceInfoResponse {
  repeated yamcsManagement.ServiceInfo service = 1;
}
{% endproto %}
