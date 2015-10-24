---
layout: default
permalink: /docs/api/Get_Parameter_Detail/
sidebar: yes
---

Return the data for the given parameter:

    GET /api/:instance/parameters/:namespace/:name

The `:namespace` segment can be any of the valid namespaces for this parameter. In case of fully qualified XTCE names, the `:namespace` segment must be repeated for every nested space system.

For example these URIs both point to the same parameter resource:

    /simulator/parameters/MDB%3AOPS+Name/SIMULATOR_BatteryVoltage2
    /simulator/parameters/YSS/SIMULATOR/BatteryVoltage2
    
Notice the use of `%3A` and `+` to URL-encode `MDB:OPS Name` to the ASCII character set. The server supports UTF-8 but your client may not.

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
        <td>Formats the JSON result in a human readable manner</td>
    </tr>
</table>

### Response

{% highlight json %}
{
  "description" : {
    "qualifiedName" : "/YSS/SIMULATOR/BatteryVoltage2",
    "aliases" : [ {
      "name" : "SIMULATOR_BatteryVoltage2",
      "namespace" : "MDB:OPS Name"
    }, {
      "name" : "BatteryVoltage2",
      "namespace" : "/YSS/SIMULATOR"
    } ]
  },
  "type" : {
    "engType" : "integer",
    "dataEncoding" : "IntegerDataEncoding(sizeInBits:8, encoding:unsigned, defaultCalibrator:null byteOrder:BIG_ENDIAN)"
  },
  "dataSource" : "TELEMETERED",
  "url" : "http://localhost:8090/api/simulator/parameters/YSS/SIMULATOR/BatteryVoltage2"
}
{% endhighlight %}


### Bulk

Combine multiple parameter queries in one and the same request using this address:

    GET /api/:instance/parameters/bulk
    
Specify the parameter IDs in the request body:

{% highlight json %}
{
  "id" : [ {
    "name": "YSS_ccsds-apid",
    "namespace": "MDB:OPS Name"
  }, {
    "name": "YSS_packet-type",
    "namespace": "MDB:OPS Name"
  } ]
}
{% endhighlight %}

POST requests are also allowed, because some HTTP clients do not support GET with a request body.

In the response the requested parameter ID is returned for every match. Example:

{% highlight json %}
{
  "response" : [ {
    "id" : {
      "name" : "YSS_ccsds-apid",
      "namespace" : "MDB:OPS Name"
    },
    "parameter" : {
      "description" : {
        "qualifiedName" : "/YSS/ccsds-apid",
        "aliases" : [ {
          "name" : "YSS_ccsds-apid",
          "namespace" : "MDB:OPS Name"
        }, {
          "name" : "ccsds-apid",
          "namespace" : "/YSS"
        } ]
      },
      "type" : {
        "engType" : "integer",
        "dataEncoding" : "IntegerDataEncoding(sizeInBits:11, encoding:unsigned, defaultCalibrator:null byteOrder:BIG_ENDIAN)"
      },
      "dataSource" : "TELEMETERED",
      "url" : "http://localhost:8090/api/simulator/parameters/YSS/ccsds-apid"
    }
  } ]
}
{% endhighlight %} 


### Protobuf

Response body is of type `Mdb.ParameterInfo`:

{% highlight nginx %}
message ParameterInfo {
  optional NameDescriptionInfo description = 2;
  optional ParameterTypeInfo type = 3;
  optional DataSourceType dataSource = 4;
  optional string url = 5;
}
{% endhighlight %}

Bulk requests are of type `Rest.BulkGetParameterRequest`:

{% highlight nginx %}
message BulkGetParameterRequest {
  repeated yamcs.NamedObjectId id = 1;
}
{% endhighlight %}

Bulk Responses are of type `Rest.BulkGetParameterResponse`:

{% highlight nginx %}
message BulkGetParameterResponse {
  message GetParameterResponse {
    optional yamcs.NamedObjectId id = 1;
    optional mdb.ParameterInfo parameter = 2;
  }

  repeated GetParameterResponse response = 1;
}
{% endhighlight %}

Supporting definitions:

<pre class="header">
  mdb.proto
</pre>

{% highlight nginx %}
message NameDescriptionType {
  optional string qualifiedName = 1;
  optional string shortDescription = 2;
  optional string longDescription = 3;
  repeated yamcs.NamedObjectId aliases = 4;
}

message ParameterTypeInfo {
  optional string engType = 1;
  optional string dataEncoding = 2;
  repeated UnitInfo unitSet = 3;
  optional AlarmInfo defaultAlarm = 4;
}

message UnitInfo {
  optional string unit = 1;
}

message AlarmInfo {
  optional int32 minViolations = 1;
  repeated AlarmRange staticAlarmRanges = 2;
}

message AlarmRange {
  optional AlarmLevel level = 1; 
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

enum DataSourceType {
  TELEMETERED = 0;
  DERIVED = 1;
  CONSTANT = 2;
  LOCAL = 3;
  SYSTEM = 4;
  COMMAND = 5;
  COMMAND_HISTORY = 6;
}
{% endhighlight %}


<pre class="header">
  yamcs.proto
</pre>

{% highlight nginx %}
message NamedObjectId {
  required string name = 1;
  optional string namespace = 2;
}
{% endhighlight %}
