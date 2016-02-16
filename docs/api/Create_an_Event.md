---
layout: default
permalink: /docs/api/Create_an_Event/
sidebar: yes
---

Create an Event:

    POST /api/archive/:instance/events/
    
  
### Parameters

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">source</td>
    <td class="code">string</td>
    <td>The origin of the event.</td>
  </tr>
  <tr>
    <td class="code">seqNumber</td>
    <td class="code">integer</td>
    <td>The sequence number as specified by the origin. This gets communicated back in event history.</td>
  </tr>
  <tr>
    <td class="code">message</td>
    <td class="code">string</td>
    <td>Message content of the event.</td>
  </tr>
  <tr>
    <td class="code">generationTime</td>
    <td class="code">integer</td>
    <td>Generation time of the event in numeric format. As the number of milliseconds since 1/1/1970.</td>
  </tr>
  <tr>
    <td class="code">receptionTime</td>
    <td class="code">string</td>
    <td>Reception time of the event in numeric format. Might be overwritten by the server.</td>
  </tr>
  <tr>
    <td class="code">severity</td>
    <td class="code">string</td>
    <td>
      Severity level of the event. Can be one of "INFO", "WARNING", "ERROR".
    </td>
  </tr>
</table>


### Example

{% highlight json %}
{
  "source":"REST API",
  "type":"Test",
  "seqNumber":3,
  "message":"this is a test event",
  "generationTime":0,
  "receptionTime":0,
 "severity":"WARNING"
}
{% endhighlight %}

### Response

<pre class="header">Status: 200 OK</pre>


### Protobuf

#### Request

<pre class="r header"><a href="/docs/api/yamcs.proto/">yamcs.proto</a></pre>
{% highlight proto %}
message Event {
  enum EventSeverity {
    INFO = 0;
    WARNING = 1;
    ERROR = 2;
  }
  required string source = 1;
  required int64 generationTime = 2;
  required int64 receptionTime = 3;
  required int32 seqNumber = 4;
  optional string type = 5;
  required string message = 6;
  optional EventSeverity severity = 7[default=INFO];

  optional string generationTimeUTC = 8;
  optional string receptionTimeUTC = 9;

  extensions 100 to 10000;
}
{% endhighlight %}

