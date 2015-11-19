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

The response will be a stream of individual event records. When using Protobuf, every event is delimited by its byte size.

### CSV

In addition to the usual support for JSON and Protobuf, the response for this particular resource can be made to output CSV data in one of these ways:

1. Add the HTTP header: `Accept: text/csv`
1. Add a query parameter to the URI: `format=csv`

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
