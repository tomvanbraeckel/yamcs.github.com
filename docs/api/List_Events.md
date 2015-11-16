---
layout: default
permalink: /docs/api/List_Events/
sidebar: yes
---

List the history of events:

    GET /api/archive/:instance/events/

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
        <td>Filter the lower bound of the event's generation time. Specify a date string in ISO 8601 format</td>
    </tr>
    <tr>
        <td class="code">stop</td>
        <td class="code">string</td>
        <td>Filter the upper bound of the event's generation time. Specify a date string in ISO 8601 format</td>
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
    <!--tr>
        <td class="code">q</td>
        <td class="code">string</td>
        <td>The search keywords.</td>
    </tr-->
    <tr>
        <td class="code">order</td>
        <td class="code">string</td>
        <td>The order of the returned results. Can be either <tt>asc</tt> or <tt>desc</tt>. Default: <tt>desc</tt></td>
    </tr>
</table>

The <tt>pos</tt> and <tt>limit</tt> allow for pagination. Keep in mind that in-between two requests extra data may have been recorded, causing a shift of the results. This generic stateless operation does not provide a reliable mechanism against that, so address it by overlapping your <tt>pos</tt> parameter with rows of the previous query. In this example we overlap by 4:

    ?pos=0&limit=50&order=desc
    ?pos=45&limit=50&order=desc
    
An alternative is to download the events instead.


### Media Type

In addition to the usual support for JSON and Protobuf, the response for this particular resource can be made to output CSV data by setting the HTTP `Accept` header to `text/csv`. 


### Response

<pre class="header">
Status: 200 OK
</pre>

{% highlight json %}
{
  "event" : [ {
    "source" : "AlarmChecker",
    "generationTime" : 1447425863786,
    "receptionTime" : 1447425863786,
    "seqNumber" : 15,
    "type" : "IN_LIMITS",
    "message" : "Parameter /YSS/SIMULATOR/BatteryVoltage2 has changed to value 222",
    "severity" : "INFO",
    "generationTimeUTC" : "2015-11-13T14:43:47.786",
    "receptionTimeUTC" : "2015-11-13T14:43:47.786"
  } ]
}
{% endhighlight %}

Or when requesting CSV:

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

### Protobuf

Response:

<pre class="r header">rest.proto</pre>
{% highlight nginx %}
message ListEventsResponse {
  repeated yamcs.Event event = 1;
}
{% endhighlight %}
