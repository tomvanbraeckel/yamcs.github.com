---
layout: default
permalink: /docs/api/List_Commands/
sidebar: yes
---

List all commands defined in the Mission Database for the given Yamcs instance:

    GET /api/:instance/commands


List all commands defined under the given namespace:

    GET /api/:instance/commands/:namespace
    
In case of fully qualified XTCE names, the `:namespace` segment must be repeated for every nested space system.

For example these URIs are all valid:

    /api/simulator/commands/MDB%3AOPS+Name
    /api/simulator/commands/YSS/SIMULATOR
    
Notice the use of `%3A` and `+` to URL-encode `MDB:OPS Name` to the ASCII character set. The server supports UTF-8 but your client may not.


### Parameters

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">q</td>
    <td class="code">string</td>
    <td>The search keywords.</td>
  </tr>
  <tr>
    <td class="code">pretty</td>
    <td class="code">bool</td>
    <td>Format the JSON result in a human readable manner.</td>
  </tr>
</table>

The `q` parameter supports searching on namespace or name. For example:

    /api/simulator/commands?q=volt+on&pretty 


### Response

{% highlight json %}
{
  "command" : [ {
    "description" : {
      "qualifiedName" : "/YSS/SIMULATOR/SWITCH_VOLTAGE_ON",
      "aliases" : [ {
        "name" : "SIMULATOR_SWITCH_VOLTAGE_ON",
        "namespace" : "MDB:OPS Name"
      }, {
        "name" : "SWITCH_VOLTAGE_ON",
        "namespace" : "/YSS/SIMULATOR"
      } ]
    },
    "baseCommandUrl" : "http://localhost:8090/api/simulator/commands/YSS/SIMULATOR/SIM_TC",
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
    "url" : "http://localhost:8090/api/simulator/commands/YSS/SIMULATOR/SWITCH_VOLTAGE_ON"
  } ]
}
{% endhighlight %}


### Protobuf

Response body is of type `Rest.ListCommandsResponse`

{% highlight nginx %}
message ListCommandsResponse {
  repeated mdb.CommandInfo command = 1;
}
{% endhighlight %}

Supporting definitions:

<pre class="header">
  mdb.proto
</pre>

{% highlight nginx %}
message CommandInfo {
  optional NameDescriptionInfo description = 1;
  optional CommandInfo baseCommand = 2;
  optional string baseCommandUrl = 3;
  optional bool abstract = 4;
  repeated ArgumentInfo argument = 5;
  repeated ArgumentAssignmentInfo argumentAssignment = 6;
  optional SignificanceInfo significance = 7;
  repeated TransmissionConstraintInfo constraint = 8;
  optional string url = 9;
}

message NameDescriptionType {
  optional string qualifiedName = 1;
  optional string shortDescription = 2;
  optional string longDescription = 3;
  repeated yamcs.NamedObjectId aliases = 4;
}

message ArgumentInfo {
  optional string name = 1;
  optional string description = 2;
  optional string type = 3;
  optional string initialValue = 4;
  repeated UnitInfo unitSet = 5;
}

message UnitInfo {
  optional string unit = 1;
}

message ArgumentAssignmentInfo {
  optional string name = 1;
  optional string value = 2;
}

message SignificanceInfo {
  enum SignificanceLevelType {
    NONE = 1;
    WATCH = 2;
    WARNING = 3;
    DISTRESS = 4;
    CRITICAL = 5;
    SEVERE = 6;
  }

  optional SignificanceLevelType consequenceLevel = 1;
  optional string reasonForWarning = 2;
}

message TransmissionConstraintInfo {
  repeated ComparisonInfo comparison = 1;
  optional int64 timeout = 2;
}

message ComparisonInfo {
  enum OperatorType {
    EQUAL_TO = 1;
    NOT_EQUAL_TO = 2;
    GREATER_THAN = 3;
    GREATER_THAN_OR_EQUAL_TO = 4;
    SMALLER_THAN = 5;
    SMALLER_THAN_OR_EQUAL_TO = 6;
  }

  optional string parameter = 1;
  optional OperatorType operator = 2;
  optional string value = 3;
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
