---
layout: default
permalink: /docs/api/List_Container_Info/
sidebar: yes
---

List all containers defined in the Mission Database for the given Yamcs instance:

    GET /api/mdb/:instance/containers

### Parameters

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">namespace</td>
    <td class="code">string</td>
    <td>Include containers under the specified namespace only</td>
  </tr>
  <tr>
    <td class="code">recurse</td>
    <td class="code">bool</td>
    <td>If a <tt>namespace</tt> is given, specifies whether to list containers of any nested sub systems. Default <tt>no</tt>.</td>
  </tr>
  <tr>
    <td class="code">q</td>
    <td class="code">string</td>
    <td>The search keywords.</td>
  </tr>
</table>

The `q` parameter supports searching on the namespace or name. For example:

    /api/mdb/simulator/containers?q=yss+dhs


### Response

<pre class="header">Status: 200 OK</pre>
```json
{
  "container" : [ {
    "name": "DHS",
    "qualifiedName" : "/YSS/SIMULATOR/DHS",
    "alias" : [ {
      "name" : "SIMULATOR_DHS",
      "namespace" : "MDB:OPS Name"
    }, {
      "name" : "DHS",
      "namespace" : "/YSS/SIMULATOR"
    } ],
    "maxInterval" : 1500,
    "baseContainer" : {
      "name": "ccsds-default",
      "qualifiedName" : "/YSS/ccsds-default"
    },
    "restrictionCriteria" : [ {
      "parameter" : {
        "name": "ccsds-apid",
        "qualifiedName" : "/YSS/ccsds-apid"
      },
      "operator" : "EQUAL_TO",
      "value" : "1"
    }, {
      "parameter" : {
        "name": "packet-id",
        "qualifiedName" : "/YSS/packet-id"
      },
      "operator" : "EQUAL_TO",
      "value" : "2"
    } ],
    "entry" : [ {
      "locationInBits" : 128,
      "referenceLocation" : "CONTAINER_START",
      "parameter" : {
        "name": "PrimBusVoltage1",
        "qualifiedName" : "/YSS/SIMULATOR/PrimBusVoltage1"
      }
    }, {
      "locationInBits" : 136,
      "referenceLocation" : "CONTAINER_START",
      "parameter" : {
        "name": "PrimBusCurrent1",
        "qualifiedName" : "/YSS/SIMULATOR/PrimBusCurrent1"
      }
    } ]
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
message ListContainerInfoResponse {
  repeated mdb.ContainerInfo container = 1;
}
```
