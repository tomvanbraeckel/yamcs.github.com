---
layout: default
permalink: /docs/api/User/
sidebar: yes
---

Get information on the authenticated user:

    GET /api/user


### Response

<pre class="header">Status: 200 OK</pre>
{% highlight json %}
{
  "login" : "anonymous",
  "roles" : [ "admin" ],
  "tmParaPrivileges" : [ ".*" ],
  "tmParaSetPrivileges" : [ ".*" ],
  "tmPacketPrivileges" : [ ".*" ],
  "tcPrivileges" : [ ".*" ],
  "systemPrivileges" : [ "MayControlYProcessor", "MayModifyCommandHistory", "MayControlCommandQueue", "MayCommandPayload", "MayGetMissionDatabase", "MayControlArchiving" ]
}
{% endhighlight %}

### Protobuf

Request:

<pre class="r header">yamcsManagement.proto</pre>
{% highlight nginx %}
message UserInfo {
  optional string login = 1;
  repeated ClientInfo clientInfo = 2;
  repeated string roles = 3;
  repeated string tmParaPrivileges = 4;
  repeated string tmParaSetPrivileges = 5;
  repeated string tmPacketPrivileges = 6;
  repeated string tcPrivileges = 7;
  repeated string systemPrivileges = 8;
}
{% endhighlight %}
