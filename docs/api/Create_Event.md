---
layout: default
permalink: /docs/api/Create_Event/
sidebar: yes
---

Create an event for the given Yamcs instance:

    POST /api/archive/:instance/events/


### Parameters

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">message</td>
    <td class="code">string</td>
    <td><strong>Required.</strong> Event message.</td>
  </tr>
  <tr>
    <td class="code">type</td>
    <td class="code">string</td>
    <td>Description of the type of the event. Useful for quick classification or filtering.</td>
  </tr>
  <tr>
    <td class="code">severity</td>
    <td class="code">string</td>
    <td>The severity level of the event. One of <tt>info</tt>, <tt>watch</tt>, <tt>warning</tt>, <tt>distress</tt>, <tt>critical</tt> or <tt>severe</tt>. Default is <tt>info</tt></td>
  </tr>
  <tr>
    <td class="code">time</td>
    <td class="code">string</td>
    <td>Time associated with the event. Must be a date string in ISO 8601 format. If unspecified, this will default to the current mission time.</td>
  </tr>
  <tr>
    <td class="code">source</td>
    <td class="code">string</td>
    <td>Source of the event. Useful for grouping events in the archive. Default is <tt>User</tt>.</td>
  </tr>
  <tr>
    <td class="code">sequence_number</td>
    <td class="code">int</td>
    <td>Sequence number of this event. This is primarily used to determine unicity of events coming from the same source. If not set Yamcs will automatically assign a sequential number as if every submitted event is unique.</td>
  </tr>
</table>


### Example

Create an informatory event at the current mission time:

```json
{
  "message": "Some info message"
}
```

Add a critical event in the past:

```json
{
  "message":"Some critical message",
  "severity": "critical",
  "time": "2015-01-01T00:00:00.000Z",
}
```

### Response

The full event is returned in the response body, including fields that are added by Yamcs Server.

<pre class="header">Status: 200 OK</pre>
```json
{
  "source": "User",
  "generationTime": "1524258406719",
  "receptionTime": "1524258406719",
  "seqNumber": 0,
  "message": "Some info message",
  "severity": "INFO",
  "generationTimeUTC": "2018-04-20T21:06:09.719Z",
  "receptionTimeUTC": "2018-04-20T21:06:09.719Z",
  "createdBy": "admin"
}
```


### Alternative Media Types

#### Protobuf

Use these HTTP headers:

    Content-Type: application/protobuf
    Accept: application/protobuf
    
Request is of type:

<pre class="r header"><a href="/docs/api/rest.proto/">rest.proto</a></pre>
```proto
message CreateEventRequest {
  optional string type = 1;
  optional string message = 2;
  optional string severity = 3;
  optional string time = 4;
  optional string source = 5;
  optional int32 sequenceNumber = 6;
}
```
