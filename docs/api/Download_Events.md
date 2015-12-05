---
layout: default
permalink: /docs/api/Download_Events/
sidebar: yes
---

Download archived events:

    GET /api/archive/:instance/downloads/events
    
<div class="hint">
This operation will possibly download a very large file. If you worry about size for your application, check out the support for <a href="/docs/api/List_Events/">paged event retrievals</a> instead.
</div>


### Parameters

<table class="inline">
    <tr>
        <th>Name</th>
        <th>Type</th>
        <th>Description</th>
    </tr>
    <tr>
        <td class="code">source</td>
        <td class="code">array of strings</td>
        <td>
            The source of the events. Both these notations are accepted:
            <ul>
                <li><tt>?source=DataHandler,CustomAlgorithm</tt></li>
                <li><tt>?source[]=DataHandler&source[]=CustomAlgorithm</tt></li>
            </ul>
            Names must match exactly.
        </td>
    </tr>
    <!--tr>
        <td class="code">type</td>
        <td class="code">array of strings</td>
        <td>
            The type of the events. Both these notations are accepted:
            <ul>
                <li><tt>?type=HK,Power</tt></li>
                <li><tt>?type[]=HK&type[]=Power</tt></li>
            </ul>
            Names must match exactly.
        </td>
    </tr-->
    <tr>
        <td class="code">start</td>
        <td class="code">string</td>
        <td>Filter the lower bound of the event's generation time. Specify a date string in ISO 8601 format</td>
    </tr>
    <tr>
        <td class="code">stop</td>
        <td class="code">string</td>
        <td>Filter the upper bound of the event's generation time. Specify a date string in ISO 8601 format</td>
    </tr>
    <tr>
        <td class="code">order</td>
        <td class="code">string</td>
        <td>The order of the returned results. Can be either <tt>asc</tt> or <tt>desc</tt>. Default: <tt>asc</tt></td>
    </tr>
</table>


### Response

The response will be a stream of self-standing event records.

### Alternative Media Types

#### CSV

Use HTTP header:

    Accept: text/csv
    
Or, add this query parameter to the URI: `format=csv`.
    
Response:

<pre class="header">
Status: 200 OK
Content-Type: text/csv
</pre>

{% highlight text %}
Source  Generation Time Reception Time  Event Type      Event Text
AlarmChecker    2015-11-13T14:46:36.029 2015-11-13T14:46:36.029 IN_LIMITS       Parameter /YSS/SIMULATOR/BatteryVoltage2 has changed to value 195
AlarmChecker    2015-11-13T14:46:29.784 2015-11-13T14:46:29.784 IN_LIMITS       Parameter /YSS/SIMULATOR/BatteryVoltage2 has changed to value 196
AlarmChecker    2015-11-13T14:46:23.571 2015-11-13T14:46:23.571 IN_LIMITS       Parameter /YSS/SIMULATOR/BatteryVoltage2 has changed to value 197
{% endhighlight %}

#### Protobuf

Use HTTP header:

    Accept: application/protobuf

The response if a stream of individual Protobuf messages delimited by a <tt>VarInt</tt>. Messages are of type:

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
