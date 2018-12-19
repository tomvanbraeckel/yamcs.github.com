---
layout: default
permalink: /docs/http/List_Instances/
sidebar: yes
---

List all configured Yamcs instances:

    GET /api/instances

### Parameters
<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">filter</td>
    <td class="code">string</td>
    <td>Filter the instances listed in the response. The parameter can be specified multiple times filter on multiple conditions (which have all to be true).
    <br>
    Each fitler has the form <code>key &lt;operator&gt; value </code> and the operator can be either = or !=.
    <br>
    Supported keys are:
    <ul>
     <li><code>state</code> - filter instances with a specific state (OFFLINE, RUNNING or FAILED). </li>
     <li><code>tag:&lt;tag-name&gt;</code> - filter instances with specific tags set to the given value.</li>
    </ul>
    </td>
  </tr>
</table>


### Response

<pre class="header">Status: 200 OK</pre>
```json
{
  "instance" : [ {
    "name" : "simulator",
    "missionDatabase" : {
      "configName" : "landing",
      "name" : "",
      "spaceSystem" : [ {
        "name" : "yamcs",
        "qualifiedName" : "/yamcs"
      }, {
        "name" : "YSS",
        "qualifiedName" : "/YSS",
        "sub" : [ {
          "name" : "SIMULATOR",
          "qualifiedName" : "/YSS/SIMULATOR"
        } ]
      }, {
        "name" : "GS",
        "qualifiedName" : "/GS"
      } ]
    },
    "processor" : [ {
      "name" : "realtime"
    } ]
  } ]
}
```


### Alternative Media Types

#### Protobuf

Use HTTP header:

    Accept: application/protobuf
    
Response is of type:

{% proto rest/rest.proto %}
message ListInstancesResponse {
  repeated yamcsManagement.YamcsInstance instance = 1;
}
{% endproto %}
