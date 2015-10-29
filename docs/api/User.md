---
layout: default
permalink: /docs/api/User/
sidebar: yes
---

Get the authenticated user:

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

Request body is of type `Yamcs.UserInfo`:

{% highlight nginx %}
message UserInfo {
  optional string login = 1;
  repeated string roles = 2;
  repeated string tmParaPrivileges = 3;
  repeated string tmParaSetPrivileges = 4;
  repeated string tmPacketPrivileges = 5;
  repeated string tcPrivileges = 6;
  repeated string systemPrivileges = 7;
}
{% endhighlight %}
