---
layout: default
permalink: /docs/api/List_Commands/
sidebar: yes
---

List the command history of all commands:

    GET /api/archive/:instance/commands

List the command history of one specific command:

    GET /api/archive/:instance/commands/:namespace/:name

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
        <td>Filter the lower bound of the command's generation time. Specify a date string in ISO 8601 format. This bound is inclusive.</td>
    </tr>
    <tr>
        <td class="code">stop</td>
        <td class="code">string</td>
        <td>Filter the upper bound of the command's generation time. Specify a date string in ISO 8601 format. This bound is exclusive.</td>
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
        <td>The order of the returned results. Can be either <tt>asc</tt> or <tt>desc</tt>. Default: <tt>desc</tt></td>
    </tr>
</table>

The <tt>pos</tt> and <tt>limit</tt> allow for pagination. Keep in mind that in-between two requests extra data may have been recorded, causing a shift of the results. This stateless operation does not provide a reliable mechanism against that, so address it by overlapping your <tt>pos</tt> parameter with rows of the previous query. In this example we overlap by 4:

    ?pos=0&limit=50&order=desc
    ?pos=45&limit=50&order=desc
    
An alternative is to download the command history instead.

### Response

<pre class="header">
Status: 200 OK
</pre>

```json
{
 "entry" : [ {
   "commandId" : {
     "generationTime" : 1491552506387,
     "origin" : "user@my-machine",
     "sequenceNumber" : 1,
     "commandName" : "/YSS/SIMULATOR/DUMP_RECORDING"
   },
   "attr" : [ {
     "name" : "binary",
     "value" : {
       "type" : "BINARY",
       "binaryValue" : "GGTAAAAAAAAAAABqAAAABnNkZnFzZgAAAAAH"
     }
   }, {
     "name" : "username",
     "value" : {
       "type" : "STRING",
       "stringValue" : "admin"
     }
   }, {
     "name" : "source",
     "value" : {
       "type" : "STRING",
       "stringValue" : "YSS/SIMULATOR/DUMP_RECORDING(filename: \"sdfqsf\", speed: 7)"
     }
   }, {
     "name" : "TransmissionConstraints",
     "value" : {
       "type" : "STRING",
       "stringValue" : "NA"
     }
   }, {
     "name" : "Final_Sequence_Count",
     "value" : {
       "type" : "STRING",
       "stringValue" : "80"
     }
   }, {
     "name" : "Acknowledge_FSC_Status",
     "value" : {
       "type" : "STRING",
       "stringValue" : "ACK: OK"
     }
   }, {
     "name" : "Acknowledge_FSC_Time",
     "value" : {
       "type" : "TIMESTAMP",
       "timestampValue" : 1491552507470
     }
   }, {
     "name" : "Acknowledge_FRC_Status",
     "value" : {
       "type" : "STRING",
       "stringValue" : "ACK: OK"
     }
   }, {
     "name" : "Acknowledge_FRC_Time",
     "value" : {
       "type" : "TIMESTAMP",
       "timestampValue" : 1491552507870
     }
   }, {
     "name" : "Acknowledge_DASS_Status",
     "value" : {
       "type" : "STRING",
       "stringValue" : "ACK: OK"
     }
   }, {
     "name" : "Acknowledge_DASS_Time",
     "value" : {
       "type" : "TIMESTAMP",
       "timestampValue" : 1491552508270
     }
   }, {
     "name" : "Acknowledge_MCS_Status",
     "value" : {
       "type" : "STRING",
       "stringValue" : "ACK: OK"
     }
   }, {
     "name" : "Acknowledge_MCS_Time",
     "value" : {
       "type" : "TIMESTAMP",
       "timestampValue" : 1491552508670
     }
   }, {
     "name" : "Acknowledge_A_Status",
     "value" : {
       "type" : "STRING",
       "stringValue" : "ACK A: OK"
     }
   }, {
     "name" : "Acknowledge_A_Time",
     "value" : {
       "type" : "TIMESTAMP",
       "timestampValue" : 1491552509070
     }
   }, {
     "name" : "Acknowledge_B_Status",
     "value" : {
       "type" : "STRING",
       "stringValue" : "ACK B: OK"
     }
   }, {
     "name" : "Acknowledge_B_Time",
     "value" : {
       "type" : "TIMESTAMP",
       "timestampValue" : 1491552510070
     }
   }, {
     "name" : "Acknowledge_C_Status",
     "value" : {
       "type" : "STRING",
       "stringValue" : "ACK C: OK"
     }
   }, {
     "name" : "Acknowledge_C_Time",
     "value" : {
       "type" : "TIMESTAMP",
       "timestampValue" : 1491552511070
     }
   }, {
     "name" : "Acknowledge_D_Status",
     "value" : {
       "type" : "STRING",
       "stringValue" : "ACK D: OK"
     }
   }, {
     "name" : "Acknowledge_D_Time",
     "value" : {
       "type" : "TIMESTAMP",
       "timestampValue" : 1491552517070
     }
   } ]
 } ]
}
```

### Alternative Media Types

#### Protobuf

Use HTTP header:

    Accept: application/protobuf

Responses are of type:

<pre class="r header"><a href="/docs/api/rest.proto/">rest.proto</a></pre>
```proto
message ListCommandsResponse {
  repeated commanding.CommandHistoryEntry entry = 1;
}
```
