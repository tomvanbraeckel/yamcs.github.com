---
layout: default
permalink: /docs/api/Update_an_Alarm/
sidebar: yes
---

    PATCH /api/processors/:instance/:processor/parameters/:namespace/:name/alarms/:id
    
### Parameters

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">state</td>
    <td class="code">string</td>
    <td><strong>Required.</strong> The state of the alarm. Either <tt>acknowledged</tt> or <tt>unacknowledged</tt></td>
  </tr>
  <tr>
    <td class="code">comment</td>
    <td class="code">string</td>
    <td>Message documenting the alarm change.</td>
  </tr>
  <tr>
    <td class="code">pretty</td>
    <td class="code">bool</td>
    <td>Format the JSON result in a human readable manner. Default: <tt>no</tt></td>
  </tr>
</table>

### Example

{% highlight json %}
{
  "state": "acknowledged",
  "comment": "bla bla"
}
{% endhighlight %}

### Response

The response contains the updated alarm info:

{% highlight json %}
todo
{% endhighlight %}

### Protobuf

Request body is of type <code>Rest.PatchAlarmRequest</code>

{% highlight nginx %}
message PatchAlarmRequest {
  optional string state = 1;
  optional string comment = 2;
}
{% endhighlight %}

The response is of type `Alarms.AlarmInfo`.

{% highlight nginx %}
message AlarmInfo {
  enum Type {
    ACTIVE = 1;  // Initial active alarms at the moment of request
    TRIGGERED = 2;  // Whenever a new alarm triggers
    SEVERITY_INCREASED = 3;  // Whenever an alarm jumps severity
    PVAL_UPDATED = 4;  // Whenever a pval is updated (even if that pval is not a violation by itself)
    ACKNOWLEDGED = 5;  // Whenever somebody acknowledged an alarm (it could be that it is still OOL)
    CLEARED = 6; // When the alarm was really cleared by the server (acknowledged && not OOL)
  }
  optional uint32 id = 1;
  optional Type type = 2;
  optional pvalue.ParameterValue triggerValue = 3;
  optional pvalue.ParameterValue mostSevereValue = 4;
  optional pvalue.ParameterValue currentValue = 5;
  optional uint32 violations = 6;
  optional AcknowledgeInfo acknowledgeInfo = 7;
}
{% endhighlight %}

Supporting definitions:

{% highlight nginx %}
message AcknowledgeInfo {
  optional string acknowledgedBy = 1;
  optional string acknowledgeMessage = 2;
  optional int64 acknowledgeTime = 3;
  optional string acknowledgeTimeUTC = 4;
}
{% endhighlight %}
