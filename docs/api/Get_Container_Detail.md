---
layout: default
permalink: /docs/api/Get_Container_Detail/
sidebar: yes
---

Return the data for the given container:

    GET /api/:instance/containers/:namespace/:name

The `:namespace` segment can be any of the valid namespaces for this container. In case of fully qualified XTCE names, the `:namespace` segment must be repeated for every nested space system.

For example these URIs both point to the same container resource:

    /api/simulator/containers/MDB%3AOPS+Name/SIMULATOR_DHS
    /api/simulator/containers/YSS/SIMULATOR/DHS
    
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
    "qualifiedName" : "/YSS/ccsds-default",
    "alias" : [ {
      "name" : "YSS_ccsds-default",
      "namespace" : "MDB:OPS Name"
    }, {
      "name" : "ccsds-default",
      "namespace" : "/YSS"
    } ],
    "entry" : [ {
      "locationInBits" : 5,
      "referenceLocation" : "CONTAINER_START",
      "parameter" : {
        "qualifiedName" : "/YSS/ccsds-apid",
        "alias" : [ {
          "name" : "YSS_ccsds-apid",
          "namespace" : "MDB:OPS Name"
        }, {
          "name" : "ccsds-apid",
          "namespace" : "/YSS"
        } ],
        "type" : {
          "engType" : "integer",
          "dataEncoding" : "IntegerDataEncoding(sizeInBits:11, encoding:unsigned, defaultCalibrator:null byteOrder:BIG_ENDIAN)"
        },
        "dataSource" : "TELEMETERED",
        "url" : "http://localhost:8090/api/simulator/parameters/YSS/ccsds-apid"
      }
    }, {
      "locationInBits" : 82,
      "referenceLocation" : "CONTAINER_START",
      "parameter" : {
        "qualifiedName" : "/YSS/packet-type",
        "alias" : [ {
          "name" : "YSS_packet-type",
          "namespace" : "MDB:OPS Name"
        }, {
          "name" : "packet-type",
          "namespace" : "/YSS"
        } ],
        "type" : {
          "engType" : "integer",
          "dataEncoding" : "IntegerDataEncoding(sizeInBits:4, encoding:unsigned, defaultCalibrator:null byteOrder:BIG_ENDIAN)"
        },
        "dataSource" : "TELEMETERED",
        "url" : "http://localhost:8090/api/simulator/parameters/YSS/packet-type"
      }
    }, {
      "locationInBits" : 96,
      "referenceLocation" : "CONTAINER_START",
      "parameter" : {
        "qualifiedName" : "/YSS/packet-id",
        "alias" : [ {
          "name" : "YSS_packet-id",
          "namespace" : "MDB:OPS Name"
        }, {
          "name" : "packet-id",
          "namespace" : "/YSS"
        } ],
        "type" : {
          "engType" : "integer",
          "dataEncoding" : "IntegerDataEncoding(sizeInBits:32, encoding:unsigned, defaultCalibrator:null byteOrder:BIG_ENDIAN)"
        },
        "dataSource" : "TELEMETERED",
        "url" : "http://localhost:8090/api/simulator/parameters/YSS/packet-id"
      }
    } ],
    "url" : "http://localhost:8090/api/simulator/containers/YSS/ccsds-default"
  },
  "restrictionCriteria" : [ {
    "parameter" : {
      "qualifiedName" : "/YSS/ccsds-apid",
      "url" : "http://localhost:8090/api/simulator/parameters/YSS/ccsds-apid"
    },
    "operator" : "EQUAL_TO",
    "value" : "1"
  }, {
    "parameter" : {
      "qualifiedName" : "/YSS/packet-id",
      "url" : "http://localhost:8090/api/simulator/parameters/YSS/packet-id"
    },
    "operator" : "EQUAL_TO",
    "value" : "2"
  } ],
  "entry" : [ {
    "locationInBits" : 128,
    "referenceLocation" : "CONTAINER_START",
    "parameter" : {
      "qualifiedName" : "/YSS/SIMULATOR/PrimBusVoltage1",
      "alias" : [ {
        "name" : "SIMULATOR_PrimBusVoltage1",
        "namespace" : "MDB:OPS Name"
      }, {
        "name" : "PrimBusVoltage1",
        "namespace" : "/YSS/SIMULATOR"
      } ],
      "type" : {
        "engType" : "integer",
        "dataEncoding" : "IntegerDataEncoding(sizeInBits:8, encoding:unsigned, defaultCalibrator:null byteOrder:BIG_ENDIAN)"
      },
      "dataSource" : "TELEMETERED",
      "url" : "http://localhost:8090/api/simulator/parameters/YSS/SIMULATOR/PrimBusVoltage1"
    }
  }, {
    "locationInBits" : 136,
    "referenceLocation" : "CONTAINER_START",
    "parameter" : {
      "qualifiedName" : "/YSS/SIMULATOR/PrimBusCurrent1",
      "alias" : [ {
        "name" : "SIMULATOR_PrimBusCurrent1",
        "namespace" : "MDB:OPS Name"
      }, {
        "name" : "PrimBusCurrent1",
        "namespace" : "/YSS/SIMULATOR"
      } ],
      "type" : {
        "engType" : "integer",
        "dataEncoding" : "IntegerDataEncoding(sizeInBits:8, encoding:unsigned, defaultCalibrator:null byteOrder:BIG_ENDIAN)"
      },
      "dataSource" : "TELEMETERED",
      "url" : "http://localhost:8090/api/simulator/parameters/YSS/SIMULATOR/PrimBusCurrent1"
    }
  } ],
  "url" : "http://localhost:8090/api/simulator/containers/YSS/SIMULATOR/DHS"
}
{% endhighlight %}


### Protobuf

Response body is of type `Mdb.ContainerInfo`:

{% highlight nginx %}
message ContainerInfo {
  optional string qualifiedName = 1;
  optional string shortDescription = 2;
  optional string longDescription = 3;
  repeated yamcs.NamedObjectId alias = 4;
  optional int64 maxInterval = 5;
  optional int32 sizeInBits = 6;
  optional ContainerInfo baseContainer = 7;
  repeated ComparisonInfo restrictionCriteria = 8;
  repeated SequenceEntryInfo entry = 9;
  optional string url = 10;
}
{% endhighlight %}

Supporting definitions:

<pre class="header">
  mdb.proto
</pre>

{% highlight nginx %}
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

message SequenceEntryInfo {
  enum ReferenceLocationType {
    CONTAINER_START = 1;
    PREVIOUS_ENTRY = 2;
  }
  optional int32 locationInBits = 1;
  optional ReferenceLocationType referenceLocation = 2;
  optional ContainerInfo container = 3;
  optional ParameterInfo parameter = 4;
  optional RepeatInfo repeat = 5;
}

message RepeatInfo {
  optional int64 fixedCount = 1;
  optional ParameterInfo dynamicCount = 2;
  optional int32 bitsBetween = 3;
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
