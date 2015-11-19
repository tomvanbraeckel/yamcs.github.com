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
</table>

### Example

{% highlight json %}
{
  "state": "acknowledged",
  "comment": "bla bla"
}
{% endhighlight %}


### Protobuf

#### Request

<pre class="r header"><a href="/docs/api/rest.proto/">rest.proto</a></pre>
{% highlight nginx %}
message PatchAlarmRequest {
  optional string state = 1;
  optional string comment = 2;
}
{% endhighlight %}
