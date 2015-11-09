---
layout: default
permalink: /docs/api/Get_Parameter_Value/
sidebar: yes
---

Retrieves the current value of the specified parameter.

    GET /api/processors/:instance/:processor/parameters/:namespace/:name

The `:namespace` segment can be any of the valid namespaces for this parameter. In case of fully qualified XTCE names, the `:namespace` segment must be repeated for every nested space system.

For example these URIs both point to the same parameter value resource:

    /api/processors/simulator/realtime/parameters/MDB%3AOPS+Name/SIMULATOR_BatteryVoltage2
    /api/processors/simulator/realtime/parameters/YSS/SIMULATOR/BatteryVoltage2
    
Notice the use of `%3A` and `+` to URL-encode `MDB:OPS Name` to the ASCII character set. The server supports UTF-8 but your client may not.


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
    <tr>
        <td class="code">pretty</td>
        <td class="code">bool</td>
        <td>Format the JSON result in a human readable manner.</td>
    </tr>
</table>


### Response

{% highlight json %}
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
  "acquisitionTimeUTC" : "2015-10-27T10:06:25.269",
  "generationTimeUTC" : "2015-10-27T10:06:08.207",
  "expirationTime" : 1445940428269,
  "expirationTimeUTC" : "2015-10-27T10:06:32.269"
}
{% endhighlight %}

### Multi-get

Get the values of multiple parameters in one and the same request using this address:

    GET /api/processors/:instance/:processor/parameters/mget

The same options as in the query string can be specified in the request body. Parameter IDs are added to a list: 

{% highlight json %}
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
{% endhighlight %}

POST requests are also allowed, because some HTTP clients do not support GET with a request body.

The response is a list of parameter values:

{% highlight json %}
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
    "acquisitionTimeUTC" : "2015-10-27T11:12:37.466",
    "generationTimeUTC" : "2015-10-27T11:12:20.410",
    "expirationTime" : 1445944400466,
    "expirationTimeUTC" : "2015-10-27T11:12:44.466"
  } ]
}
{% endhighlight %}


### Protobuf

Response is of type `pvalue.ParameterValue`:

{% highlight nginx %}
message ParameterValue {
  optional yamcs.NamedObjectId id = 1;
  optional yamcs.Value rawValue = 2;
  optional yamcs.Value engValue = 3;
  optional int64 acquisitionTime = 4;
  optional int64 generationTime = 5;
  optional AcquisitionStatus acquisitionStatus = 6;
  optional bool processingStatus = 7;
  optional MonitoringResult monitoringResult = 8;

  //to be used as alternative to the ones above for clients that do not understand internal yamcs time encoding
  optional string acquisitionTimeUTC = 11;
  optional string generationTimeUTC = 12;

  optional int64 expirationTime = 23;
  optional string expirationTimeUTC = 24;

  // context-dependent ranges
  repeated mdb.AlarmRange alarmRange = 25;
}
{% endhighlight %}

Bulk requests are of type `Rest.BulkGetParameterValueRequest`:

{% highlight nginx %}
message BulkGetParameterValueRequest {
  repeated yamcs.NamedObjectId id = 1;
  optional bool fromCache = 2;
  optional uint64 timeout = 3; //if not fromCache, wait this time (in milliseconds) to receive the parameter
}
{% endhighlight %}

Bulk Responses are of type `Rest.BulkGetParameterValueResponse`:

{% highlight nginx %}
message BulkGetParameterValueResponse {
  repeated pvalue.ParameterValue value = 1;
}
{% endhighlight %}

Supporting definitions:

<pre class="r header">yamcs.proto</pre>

{% highlight nginx %}
message NamedObjectId {
  required string name = 1;
  optional string namespace = 2;
}

message Value {
  enum Type {
    FLOAT = 0;
    DOUBLE = 1;
    UINT32 = 2;
    SINT32 = 3;
    BINARY = 4;
    STRING = 5;
    TIMESTAMP = 6;
    UINT64 = 7;
    SINT64 = 8;
    BOOLEAN = 9;
  }
  required Type type = 1;
  optional float floatValue = 2;
  optional double doubleValue = 3;
  optional sint32 sint32Value = 4;
  optional uint32 uint32Value = 5;
  optional bytes binaryValue = 6;
  optional string stringValue = 7;
  optional int64 timestampValue = 8;
  optional uint64 uint64Value = 9;
  optional sint64 sint64Value = 10;
  optional bool booleanValue = 11;
}
{% endhighlight %}

<pre class="r header">pvalue.proto</pre>

{% highlight nginx %}
enum AcquisitionStatus {
  ACQUIRED = 0; //OK!
  NOT_RECEIVED = 1; //no value received so far
  INVALID = 2; //some value has been received but is invalid
  EXPIRED = 3; //the parameter is coming from a packet which has not since updated although it should have been
}

enum MonitoringResult {
  DISABLED = 0;
  IN_LIMITS = 1;
  WATCH = 7;
  WATCH_LOW = 8;
  WATCH_HIGH = 9;
  WARNING = 10;
  WARNING_LOW = 11;
  WARNING_HIGH = 12;
  DISTRESS = 13;
  DISTRESS_LOW = 14;
  DISTRESS_HIGH = 15;
  CRITICAL = 16;
  CRITICAL_LOW = 17;
  CRITICAL_HIGH = 18;
  SEVERE = 19;
  SEVERE_LOW = 20;
  SEVERE_HIGH = 21;
}
{% endhighlight %}


<pre class="r header">mdb.proto</pre>

{% highlight nginx %}
message AlarmRange {
  optional AlarmLevelType level = 1;
  optional double minInclusive = 2;
  optional double maxInclusive = 3;
  optional string enumerationValue = 4;
}

enum AlarmLevelType {
  NORMAL = 0;
  WATCH = 1;
  WARNING =  2;
  DISTRESS = 3;
  CRITICAL = 4;
  SEVERE = 5;
}
{% endhighlight %}
