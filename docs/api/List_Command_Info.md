---
layout: default
permalink: /docs/api/List_Command_Info/
sidebar: yes
---

List all commands defined in the Mission Database for the given Yamcs instance:

    GET /api/mdb/:instance/commands


List all commands defined under the given namespace:

    GET /api/mdb/:instance/commands/:namespace


### Parameters

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">recurse</td>
    <td class="code">bool</td>
    <td>If an XTCE <tt>:namespace</tt> is given, specifies whether to list commands of any nested sub systems. Default <tt>no</tt>.</td>
  </tr>
  <tr>
    <td class="code">q</td>
    <td class="code">string</td>
    <td>The search keywords.</td>
  </tr>
</table>

The `q` parameter supports searching on namespace or name. For example:

    /api/mdb/simulator/commands?q=volt+on&pretty 


### Response

<pre class="header">Status: 200 OK</pre>
```json
{
  "command" : [ {
    "name": "SWITCH_VOLTAGE_ON",
    "qualifiedName" : "/YSS/SIMULATOR/SWITCH_VOLTAGE_ON",
    "alias" : [ {
      "name" : "SIMULATOR_SWITCH_VOLTAGE_ON",
      "namespace" : "MDB:OPS Name"
    }, {
      "name" : "SWITCH_VOLTAGE_ON",
      "namespace" : "/YSS/SIMULATOR"
    } ],
    "baseCommand" : {
      "name": "SIM_TC",
      "qualifiedName" : "/YSS/SIMULATOR/SIM_TC",
      "url" : "http://localhost:8090/api/mdb/simulator/commands/YSS/SIMULATOR/SIM_TC"
    },
    "abstract" : false,
    "argument" : [ {
      "name" : "voltage_num",
      "description" : "voltage number to switch on",
      "type" : "integer",
      "unitSet" : [ {
        "unit" : "V"
      } ]
    } ],
    "argumentAssignment" : [ {
      "name" : "packet-id",
      "value" : "1"
    } ],
    "url" : "http://localhost:8090/api/mdb/simulator/commands/YSS/SIMULATOR/SWITCH_VOLTAGE_ON"
  } ]
}
```


### Alternative Media Types

#### Protobuf

Use HTTP header:

    Accept: application/protobuf
    
Response is of type:

<pre class="r header"><a href="/docs/api/rest.proto/">rest.proto</a></pre>

```proto
message ListCommandInfoResponse {
  repeated mdb.CommandInfo command = 1;
}
```
