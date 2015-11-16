---
layout: default
permalink: /docs/api/List_Alarms/
sidebar: yes
---

List all alarms for the given processor:

    GET /api/processors/:instance/:processor/alarms
    
List all alarms for the given parameter:

    GET /api/processors/:instance/:processor/parameters/:namespace/:name/alarms 
    
For each alarm you get full information on the value occurrence that initially triggered the alarm, the most severe value since it originally triggered, and the latest value at the time of your request.


### Parameters

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">filter</td>
    <td class="code">string</td>
    <td>Indicates which sort of alarms to return. Either <tt>active</tt> or <tt>all</tt>. Default: <tt>all</tt></td>
  </tr>
</table>

### Example

<pre class="header">Status: 200 OK</pre>
{% highlight json %}
{
  "alarms" : [ {
    "id" : 3,
    "triggerValue" : {
      "id" : {
        "name" : "/YSS/SIMULATOR/O2TankTemp"
      },
      "rawValue" : {
        "type" : 2,
        "uint32Value" : 227
      },
      "engValue" : {
        "type" : 2,
        "uint32Value" : 227
      },
      "acquisitionTime" : 1440576556724,
      "generationTime" : 1440576539714,
      "acquisitionStatus" : 0,
      "processingStatus" : true,
      "monitoringResult" : 21,
      "acquisitionTimeUTC" : "2015-08-26T08:08:40.724",
      "generationTimeUTC" : "2015-08-26T08:08:23.714",
      "watchLow" : 10.0,
      "watchHigh" : 12.0,
      "warningLow" : 30.0,
      "warningHigh" : 32.0,
      "distressLow" : 40.0,
      "distressHigh" : 42.0,
      "criticalLow" : 60.0,
      "criticalHigh" : 62.0,
      "severeLow" : 80.0,
      "severeHigh" : 82.0,
      "expirationTime" : 1440576558224,
      "expirationTimeUTC" : "2015-08-26T08:08:42.224"
    },
    "mostSevereValue" : {
      "id" : {
        "name" : "/YSS/SIMULATOR/O2TankTemp"
      },
      "rawValue" : {
        "type" : 2,
        "uint32Value" : 227
      },
      "engValue" : {
        "type" : 2,
        "uint32Value" : 227
      },
      "acquisitionTime" : 1440576556724,
      "generationTime" : 1440576539714,
      "acquisitionStatus" : 0,
      "processingStatus" : true,
      "monitoringResult" : 21,
      "acquisitionTimeUTC" : "2015-08-26T08:08:40.724",
      "generationTimeUTC" : "2015-08-26T08:08:23.714",
      "watchLow" : 10.0,
      "watchHigh" : 12.0,
      "warningLow" : 30.0,
      "warningHigh" : 32.0,
      "distressLow" : 40.0,
      "distressHigh" : 42.0,
      "criticalLow" : 60.0,
      "criticalHigh" : 62.0,
      "severeLow" : 80.0,
      "severeHigh" : 82.0,
      "expirationTime" : 1440576558224,
      "expirationTimeUTC" : "2015-08-26T08:08:42.224"
    },
    "currentValue" : {
      "id" : {
        "name" : "/YSS/SIMULATOR/O2TankTemp"
      },
      "rawValue" : {
        "type" : 2,
        "uint32Value" : 223
      },
      "engValue" : {
        "type" : 2,
        "uint32Value" : 223
      },
      "acquisitionTime" : 1440577186414,
      "generationTime" : 1440577169410,
      "acquisitionStatus" : 0,
      "processingStatus" : true,
      "monitoringResult" : 21,
      "acquisitionTimeUTC" : "2015-08-26T08:19:10.414",
      "generationTimeUTC" : "2015-08-26T08:18:53.410",
      "watchLow" : 10.0,
      "watchHigh" : 12.0,
      "warningLow" : 30.0,
      "warningHigh" : 32.0,
      "distressLow" : 40.0,
      "distressHigh" : 42.0,
      "criticalLow" : 60.0,
      "criticalHigh" : 62.0,
      "severeLow" : 80.0,
      "severeHigh" : 82.0,
      "expirationTime" : 1440577187914,
      "expirationTimeUTC" : "2015-08-26T08:19:11.914"
    },
    "violations" : 102
  } ]
}
{% endhighlight %}

### Protobuf
Response:

<pre class="r header">rest.proto</pre>
{% highlight nginx %}
message ListAlarmsResponse {
  repeated alarms.AlarmInfo alarm = 1;
}
{% endhighlight %}
