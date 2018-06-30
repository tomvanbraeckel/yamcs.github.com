---
layout: default
permalink: /docs/api/List_Alarms/
sidebar: yes
---

List the active alarms for the given processor:

    GET /api/processors/:instance/:processor/alarms

List the history of alarms:

    GET /api/archive/:instance/alarms
    
List the history of alarms for the given parameter:

    GET /api/archive/:instance/alarms/:namespace/:name 
    
For each alarm the response contains detailed information on the value occurrence that initially triggered the alarm, the most severe value since it originally triggered, and the latest value at the time of your request.


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
        <td>Filter the lower bound of the alarm's trigger time. Specify a date string in ISO 8601 format. This bound is inclusive.</td>
    </tr>
    <tr>
        <td class="code">stop</td>
        <td class="code">string</td>
        <td>Filter the upper bound of the alarm's trigger time. Specify a date string in ISO 8601 format. This bound is exclusive.</td>
    </tr>
    <tr>
        <td class="code">pos</td>
        <td class="code">integer</td>
        <td>The zero-based row number at which to start outputting results. Default: <tt>0</tt></td>
    </tr>
    <tr>
        <td class="code">limit</td>
        <td class="code">integer</td>
        <td>The maximum number of returned records per page. Choose this value too high and you risk hitting the maximum response size limit enforced by the server. Default: <tt>100</tt></td>
    </tr>
    <tr>
        <td class="code">order</td>
        <td class="code">string</td>
        <td>The order of the returned results. Can be either <tt>asc</tt> or <tt>desc</tt>. The sorting is always by trigger time (i.e. the generation time of the trigger value). Default: <tt>desc</tt></td>
    </tr>
</table>

### Example

<pre class="header">Status: 200 OK</pre>
```json
{
  "alarm" : [ {
    "seqNum" : 1,
    "triggerValue" : {
      "id" : {
        "name" : "/YSS/SIMULATOR/BatteryVoltage2"
      },
      "rawValue" : {
        "type" : "UINT32",
        "uint32Value" : 49
      },
      "engValue" : {
        "type" : "UINT32",
        "uint32Value" : 49
      },
      "acquisitionTime" : 1448229350720,
      "generationTime" : 1448229333628,
      "acquisitionStatus" : "ACQUIRED",
      "processingStatus" : true,
      "monitoringResult" : "WATCH",
      "rangeCondition": "LOW",
      "acquisitionTimeUTC" : "2015-11-22T21:55:14.720Z",
      "generationTimeUTC" : "2015-11-22T21:54:57.628Z",
      "expirationTime" : 1448229357720,
      "expirationTimeUTC" : "2015-11-22T21:55:21.720Z",
      "alarmRange" : [ {
        "level" : "WATCH",
        "minInclusive" : 50.0
      }, {
        "level" : "WARNING",
        "minInclusive" : 40.0
      }, {
        "level" : "DISTRESS",
        "minInclusive" : 30.0
      }, {
        "level" : "CRITICAL",
        "minInclusive" : 20.0
      }, {
        "level" : "SEVERE",
        "minInclusive" : 10.0
      } ]
    },
    "mostSevereValue" : {
      "id" : {
        "name" : "/YSS/SIMULATOR/BatteryVoltage2"
      },
      "rawValue" : {
        "type" : "UINT32",
        "uint32Value" : 39
      },
      "engValue" : {
        "type" : "UINT32",
        "uint32Value" : 39
      },
      "acquisitionTime" : 1448229413038,
      "generationTime" : 1448229395945,
      "acquisitionStatus" : "ACQUIRED",
      "processingStatus" : true,
      "monitoringResult" : "WARNING",
      "rangeCondition": "LOW",
      "acquisitionTimeUTC" : "2015-11-22T21:56:17.038Z",
      "generationTimeUTC" : "2015-11-22T21:55:59.945Z",
      "expirationTime" : 1448229420038,
      "expirationTimeUTC" : "2015-11-22T21:56:24.038Z",
      "alarmRange" : [ {
        "level" : "WATCH",
        "minInclusive" : 50.0
      }, {
        "level" : "WARNING",
        "minInclusive" : 40.0
      }, {
        "level" : "DISTRESS",
        "minInclusive" : 30.0
      }, {
        "level" : "CRITICAL",
        "minInclusive" : 20.0
      }, {
        "level" : "SEVERE",
        "minInclusive" : 10.0
      } ]
    },
    "currentValue" : {
      "id" : {
        "name" : "/YSS/SIMULATOR/BatteryVoltage2"
      },
      "rawValue" : {
        "type" : "UINT32",
        "uint32Value" : 48
      },
      "engValue" : {
        "type" : "UINT32",
        "uint32Value" : 48
      },
      "acquisitionTime" : 1448229356954,
      "generationTime" : 1448229339867,
      "acquisitionStatus" : "ACQUIRED",
      "processingStatus" : true,
      "monitoringResult" : "WATCH",
      "rangeCondition": "LOW",
      "acquisitionTimeUTC" : "2015-11-22T21:55:20.954Z",
      "generationTimeUTC" : "2015-11-22T21:55:03.867Z",
      "expirationTime" : 1448229363954,
      "expirationTimeUTC" : "2015-11-22T21:55:27.954Z",
      "alarmRange" : [ {
        "level" : "WATCH",
        "minInclusive" : 50.0
      }, {
        "level" : "WARNING",
        "minInclusive" : 40.0
      }, {
        "level" : "DISTRESS",
        "minInclusive" : 30.0
      }, {
        "level" : "CRITICAL",
        "minInclusive" : 20.0
      }, {
        "level" : "SEVERE",
        "minInclusive" : 10.0
      } ]
    }
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
message ListAlarmsResponse {
  repeated alarms.AlarmData alarm = 1;
}
```
