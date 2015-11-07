---
layout: default
permalink: /docs/api/User/
sidebar: yes
---

Get information on the authenticated user:

    GET /api/user


### Parameters

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">pretty</td>
    <td class="code">bool</td>
    <td>Format the JSON result in a human readable manner. Default: <tt>no</tt></td>
  </tr>
</table>

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

Request body is of type `YamcsManagement.UserInfo`:

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
