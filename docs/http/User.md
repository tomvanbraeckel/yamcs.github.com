---
layout: default
permalink: /docs/http/User/
sidebar: yes
---

Get information on the authenticated user:

    GET /api/user


### Response

<pre class="header">Status: 200 OK</pre>
```json
{
  "login": "admin",
  "superuser": true
}
```

### Alternative Media Types

#### Protobuf

Use HTTP header:

    Accept: application/protobuf
    
Response is of type:

<pre class="r header"><a href="/docs/http/yamcsManagement.proto/">yamcsManagement.proto</a></pre>
```proto
message UserInfo {
  optional string login = 1;
  repeated ClientInfo clientInfo = 2;
  repeated string systemPrivilege = 11;
  repeated ObjectPrivilegeInfo objectPrivilege = 12;
  optional bool superuser = 13;
}
```
