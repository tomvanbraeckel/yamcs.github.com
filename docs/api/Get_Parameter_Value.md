---
layout: default
permalink: /docs/api/Get_Parameter_Value/
sidebar: yes
---

Retrieves the current value of the specified parameter.

    GET /api/processors/:instance/:processor/parameters/:namespace/:name


### Parameters

<table class="inline">
    <tr>
        <th>Name</th>
        <th>Type</th>
        <th>Description</th>
    </tr>
    <tr>
        <td class="code">fromCache</td>
        <td class="code">bool</td>
        <td>Whether the latest cached value may be returned. Default: <tt>yes</tt></td>
    </tr>
    <tr>
        <td class="code">timeout</td>
        <td class="code">number</td>
        <td>Time in milliseconds to wait on a value (only considered if <tt>fromCache=no</tt>). When the timeout is met, the call will return with no or partial data. Default: <tt>10000</tt></td>
    </tr>
</table>


### Response

<pre class="header">Status: 200 OK</pre>
```json
{
  "id" : {
    "name" : "BatteryVoltage2",
    "namespace" : "/YSS/SIMULATOR"
  },
  "rawValue" : {
    "type" : "UINT32",
    "uint32Value" : 184
  },
  "engValue" : {
    "type" : "UINT32",
    "uint32Value" : 184
  },
  "acquisitionTime" : 1445940421269,
  "generationTime" : 1445940404207,
  "acquisitionStatus" : "ACQUIRED",
  "processingStatus" : true,
  "acquisitionTimeUTC" : "2015-10-27T10:06:25.269Z",
  "generationTimeUTC" : "2015-10-27T10:06:08.207Z",
  "expirationTime" : 1445940428269,
  "expirationTimeUTC" : "2015-10-27T10:06:32.269Z"
}
```

### Multi-get

Get the values of multiple parameters in one and the same request using this address:

    GET /api/processors/:instance/:processor/parameters/mget

The same options as in the query string can be specified in the request body. Parameter IDs are added to a list: 

```json
{
  "fromCache" : false,
  "timeout" : 15000,
  "id" : [ {
    "name": "YSS_ccsds-apid",
    "namespace": "MDB:OPS Name"
  }, {
    "name": "/YSS/SIMULATOR/BatteryVoltage2"
  } ]
}
```

POST requests are also allowed, because some HTTP clients do not support GET with a request body.

The response is a list of parameter values:

```json
{
  "value" : [ {
    "id" : {
      "name" : "/YSS/SIMULATOR/BatteryVoltage2"
    },
    "rawValue" : {
      "type" : "UINT32",
      "uint32Value" : 206
    },
    "engValue" : {
      "type" : "UINT32",
      "uint32Value" : 206
    },
    "acquisitionTime" : 1445944393466,
    "generationTime" : 1445944376410,
    "acquisitionStatus" : "ACQUIRED",
    "processingStatus" : true,
    "acquisitionTimeUTC" : "2015-10-27T11:12:37.466Z",
    "generationTimeUTC" : "2015-10-27T11:12:20.410Z",
    "expirationTime" : 1445944400466,
    "expirationTimeUTC" : "2015-10-27T11:12:44.466Z"
  } ]
}
```


### Alternative Media Types

#### Protobuf

Use these HTTP headers:

    Content-Type: application/protobuf
    Accept: application/protobuf
    
Request is of type:

<pre class="r header"><a href="/docs/api/pvalue.proto/">pvalue.proto</a></pre>
```proto
message ParameterValue {
  optional yamcs.NamedObjectId id = 1;
  optional yamcs.Value rawValue = 2;
  optional yamcs.Value engValue = 3;
  optional int64 acquisitionTime = 4;
  optional int64 generationTime = 5;
  optional AcquisitionStatus acquisitionStatus = 6;
  optional bool processingStatus = 7;
  optional MonitoringResult monitoringResult = 8;

  optional string acquisitionTimeUTC = 11;
  optional string generationTimeUTC = 12;

  optional int64 expirationTime = 23;
  optional string expirationTimeUTC = 24;

  repeated mdb.AlarmRange alarmRange = 25;
}
```

Bulk request is of type:

<pre class="r header"><a href="/docs/api/rest.proto/">rest.proto</a></pre>
```proto
message BulkGetParameterValueRequest {
  repeated yamcs.NamedObjectId id = 1;
  optional bool fromCache = 2;
  optional uint64 timeout = 3; //if not fromCache, wait this time (in milliseconds) to receive the parameter
}
```

Bulk response is of type:

<pre class="r header"><a href="/docs/api/rest.proto/">rest.proto</a></pre>
```proto
message BulkGetParameterValueResponse {
  repeated pvalue.ParameterValue value = 1;
}
```
