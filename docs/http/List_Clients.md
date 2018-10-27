---
layout: default
permalink: /docs/http/List_Clients/
sidebar: yes
---

List all clients:

    GET /api/clients

List all clients for the given Yamcs instance:

    GET /api/instances/:instance/clients
    
List all clients for the given processor:

    GET /api/processors/:instance/:processor/clients 


### Response

<pre class="header">Status: 200 OK</pre>
```json
{
  "client": [{
    "instance": "simulator",
    "id": 6,
    "username": "admin",
    "applicationName": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1 Safari/605.1.15",
    "processorName": "realtime",
    "state": "CONNECTED",
    "loginTime": "1524258579036",
    "loginTimeUTC": "2018-04-20T21:09:02.036Z"
  }]
}
```


### Alternative Media Types

#### Protobuf

Use HTTP header:

    Accept: application/protobuf
    
Response is of type:

<pre class="r header"><a href="{{ site.proto }}/rest/rest.proto">rest.proto</a></pre>
```proto
message ListClientsResponse {
  repeated yamcsManagement.ClientInfo client = 1;
}
```
