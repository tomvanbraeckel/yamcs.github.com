---
layout: default
permalink: /docs/api/Get_Command_Detail/
sidebar: yes
---

Return the data for the given command:

    GET /api/:instance/commands/:namespace/:name

The `:namespace` segment can be any of the valid namespaces for this command. In case of fully qualified XTCE names, the `:namespace` segment must be repeated for every nested space system.

For example these URIs both point to the same command resource:

    /simulator/commands/MDB%3AOPS+Name/SIMULATOR_SWITCH_VOLTAGE_ON
    /simulator/commands/YSS/SIMULATOR/SWITCH_VOLTAGE_ON
    
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
  "qualifiedName" : "/YSS/SIMULATOR/SWITCH_VOLTAGE_ON",
  "alias" : [ {
    "name" : "SIMULATOR_SWITCH_VOLTAGE_ON",
    "namespace" : "MDB:OPS Name"
  }, {
    "name" : "SWITCH_VOLTAGE_ON",
    "namespace" : "/YSS/SIMULATOR"
  } ],
  "baseCommand" : {
    "qualifiedName" : "/YSS/SIMULATOR/SIM_TC",
    "alias" : [ {
      "name" : "SIMULATOR_SIM_TC",
      "namespace" : "MDB:OPS Name"
    }, {
      "name" : "SIM_TC",
      "namespace" : "/YSS/SIMULATOR"
    } ],
    "baseCommand" : {
      "qualifiedName" : "/YSS/ccsds-tc",
      "alias" : [ {
        "name" : "YSS_ccsds-tc",
        "namespace" : "MDB:OPS Name"
      }, {
        "name" : "ccsds-tc",
        "namespace" : "/YSS"
      } ],
      "abstract" : true,
      "argument" : [ {
        "name" : "ccsds-apid",
        "type" : "integer"
      }, {
        "name" : "timeId",
        "type" : "integer"
      }, {
        "name" : "checksumIndicator",
        "type" : "integer",
        "initialValue" : "1"
      }, {
        "name" : "packet-type",
        "type" : "integer"
      }, {
        "name" : "packet-id",
        "type" : "integer"
      } ],
      "url" : "http://localhost:8090/api/simulator/commands/YSS/ccsds-tc"
    },
    "abstract" : true,
    "argumentAssignment" : [ {
      "name" : "ccsds-apid",
      "value" : "100"
    }, {
      "name" : "timeId",
      "value" : "1"
    }, {
      "name" : "packet-type",
      "value" : "10"
    } ],
    "url" : "http://localhost:8090/api/simulator/commands/YSS/SIMULATOR/SIM_TC"
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
  "url" : "http://localhost:8090/api/simulator/commands/YSS/SIMULATOR/SWITCH_VOLTAGE_ON"
}
{% endhighlight %}


### Protobuf

Response body is of type `Mdb.CommandInfo`:

{% highlight nginx %}
message CommandInfo {
  optional string qualifiedName = 1;
  optional string shortDescription = 2;
  optional string longDescription = 3;
  repeated yamcs.NamedObjectId alias = 4;
  optional CommandInfo baseCommand = 5;
  optional bool abstract = 6;
  repeated ArgumentInfo argument = 7;
  repeated ArgumentAssignmentInfo argumentAssignment = 8;
  optional SignificanceInfo significance = 9;
  repeated TransmissionConstraintInfo constraint = 10;
  optional string url = 11;
}
{% endhighlight %}

Supporting definitions:

<pre class="header">
  mdb.proto
</pre>

{% highlight nginx %}
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

  optional ParameterInfo parameter = 1;
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
