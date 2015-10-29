---
layout: default
permalink: /docs/api/List_Clients/
sidebar: yes
---

List all clients:

    GET /api/clients

List all clients for the given Yamcs instance:

    GET /api/clients/:instance
    
List all clients for the given processor:

    GET /api/clients/:instance/:processor


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
todo
{% endhighlight %}


### Protobuf

Response body is of type `Rest.ListClientsResponse`

{% highlight nginx %}
message ListClientsResponse {
  repeated yamcsManagement.ClientInfo client = 1;
}
{% endhighlight %}

Supporting definitions:

<pre class="header">
  yamcsManagement.proto
</pre>

{% highlight nginx %}
message ClientInfo {
  enum ClientState {
    CONNECTED = 0;
    DISCONNECTED = 1;
  }
  required string instance = 1;
  required int32 id = 2;
  optional string username = 3;
  optional string applicationName = 4;
  optional string processorName = 5;
  optional ClientState state = 6;
  optional bool currentClient = 7; // websocket
}
{% endhighlight %}
