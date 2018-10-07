---
layout: default
permalink: /docs/http/Get_Packet_Index/
sidebar: yes
---

Get the index of stored packets for the given instance:

    GET /api/archive/:instance/packet-index

### Parameters

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">start</td>
    <td class="code">string</td>
    <td>Filter the lower bound of the index entries. Specify a date string in ISO 8601 format.</td>
  </tr>
  <tr>
    <td class="code">stop</td>
    <td class="code">string</td>
    <td>Filter the upper bound of the index entries. Specify a date string in ISO 8601 format.</td>
  </tr>
  <tr>
    <td class="code">mergeTime</td>
    <td class="code">integer</td>
    <td>Value in milliseconds that indicates the maximum gap before two consecutive index ranges are merged together. Default: <tt>2000</tt></td>
  </tr>
  <tr>
    <td class="code">limit</td>
    <td class="code">integer</td>
    <td>
      <p>The maximum number of returned entries. Choose this value too high and you risk hitting the maximum response size limit enforced by the server. Default: <tt>1000</tt>
      </p>
      <p>
        Note that in general it is advised to control the size of the response via <tt>mergeTime</tt>, rather than via <tt>limit</tt>.
      </p>
    </td>
  </tr>
</table>
    
### Example

<pre class="header">
Status: 200 OK
</pre>

```json
{
  "group": [{
    "id": {
      "name": "/YSS/SIMULATOR/DHS"
    },
    "entry": [{
      "start": "2018-04-26T10:45:26.671Z",
      "stop": "2018-04-26T10:59:22.679Z",
      "count": 134
    }]
  }, {
    "id": {
      "name": "/YSS/SIMULATOR/FlightData"
    },
    "entry": [{
      "start": "2018-04-26T10:45:20.621Z",
      "stop": "2018-04-26T10:59:22.882Z",
      "count": 4155
    }]
  }, {
    "id": {
      "name": "/YSS/SIMULATOR/Power"
    },
    "entry": [{
      "start": "2018-04-26T10:45:26.671Z",
      "stop": "2018-04-26T10:59:22.679Z",
      "count": 134
    }]
  }, {
    "id": {
      "name": "/YSS/SIMULATOR/RCS"
    },
    "entry": [{
      "start": "2018-04-26T10:45:26.671Z",
      "stop": "2018-04-26T10:59:22.679Z",
      "count": 134
    }]
  }]
}
```

### Alternative Media Types

#### Protobuf

Use HTTP header:

    Accept: application/protobuf

Response is of type:

<pre class="r header"><a href="/docs/http/archive.proto/">archive.proto</a></pre>
```proto
message IndexResponse {
  repeated IndexGroup group = 1;
}
```
