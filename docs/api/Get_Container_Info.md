---
layout: default
permalink: /docs/api/Get_Container_Info/
sidebar: yes
---

Return the data for the given container:

    GET /api/mdb/:instance/containers/:namespace/:name


### Response

<pre class="header">Status: 200 OK</pre>
{% highlight json %}
{
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
        "name": "ccsds-apid",
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
        "url" : "http://localhost:8090/api/mdb/simulator/parameters/YSS/ccsds-apid"
      }
    }, {
      "locationInBits" : 82,
      "referenceLocation" : "CONTAINER_START",
      "parameter" : {
        "name": "packet-type",
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
        "url" : "http://localhost:8090/api/mdb/simulator/parameters/YSS/packet-type"
      }
    }, {
      "locationInBits" : 96,
      "referenceLocation" : "CONTAINER_START",
      "parameter" : {
        "name": "packet-id",
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
        "url" : "http://localhost:8090/api/mdb/simulator/parameters/YSS/packet-id"
      }
    } ],
    "url" : "http://localhost:8090/api/simulator/containers/YSS/ccsds-default"
  },
  "restrictionCriteria" : [ {
    "parameter" : {
      "name": "ccsds-apid",
      "qualifiedName" : "/YSS/ccsds-apid",
      "url" : "http://localhost:8090/api/mdb/simulator/parameters/YSS/ccsds-apid"
    },
    "operator" : "EQUAL_TO",
    "value" : "1"
  }, {
    "parameter" : {
      "name": "packet-id",
      "qualifiedName" : "/YSS/packet-id",
      "url" : "http://localhost:8090/api/mdb/simulator/parameters/YSS/packet-id"
    },
    "operator" : "EQUAL_TO",
    "value" : "2"
  } ],
  "entry" : [ {
    "locationInBits" : 128,
    "referenceLocation" : "CONTAINER_START",
    "parameter" : {
      "name": "PrimBusVoltage1",
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
      "url" : "http://localhost:8090/api/mdb/simulator/parameters/YSS/SIMULATOR/PrimBusVoltage1"
    }
  }, {
    "locationInBits" : 136,
    "referenceLocation" : "CONTAINER_START",
    "parameter" : {
      "name": "PrimBusCurrent1",
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
      "url" : "http://localhost:8090/api/mdb/simulator/parameters/YSS/SIMULATOR/PrimBusCurrent1"
    }
  } ],
  "url" : "http://localhost:8090/api/mdb/simulator/containers/YSS/SIMULATOR/DHS"
}
{% endhighlight %}


### Protobuf

Response:

<pre class="r header"><a href="/docs/api/mdb.proto/">mdb.proto</a></pre>
{% highlight proto %}
message ContainerInfo {
  optional string name = 1;
  optional string qualifiedName = 2;
  optional string shortDescription = 3;
  optional string longDescription = 4;
  repeated yamcs.NamedObjectId alias = 5;
  optional int64 maxInterval = 6;
  optional int32 sizeInBits = 7;
  optional ContainerInfo baseContainer = 8;
  repeated ComparisonInfo restrictionCriteria = 9;
  repeated SequenceEntryInfo entry = 10;
  optional string url = 11;
}
{% endhighlight %}
