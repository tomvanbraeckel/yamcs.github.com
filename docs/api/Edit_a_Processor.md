---
layout: default
permalink: /docs/api/Edit_a_Processor/
sidebar: yes
---

Edit a processor:

    PATCH /api/processors/:instance/:name


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
    <td>The state this processor should be updated to. Either <tt>PAUSED</tt> or <tt>RUNNING</tt>.</td>
  </tr>
  <tr>
    <td class="code">seek_time</td>
    <td class="code">integer</td>
    <td>The seek time in milliseconds.</td>
  </tr>
  <tr>
    <td class="code">speed</td>
    <td class="code">string</td>
    <td>Either <tt>afap</tt>, <tt>realtime</tt> or a fixed delay value in milliseconds.</td>
  </tr>
  <tr>
    <td class="code">pretty</td>
    <td class="code">bool</td>
    <td>Format the JSON result in a human readable manner. Default: <tt>no</tt></td>
  </tr>
</table>

The same parameters can also be specified in the request body. In case both query string parameters and body parameters are specified, they are merged with priority being given to query string parameters.

### Example

Pause the processor:

{% highlight json %}
{
  "state" : "PAUSED"
}
{% endhighlight %}

Resume the processor, and set speed to 2.5x:

{% highlight json %}
{
  "state" : "RUNNING",
  "speed" : "2.5"
}
{% endhighlight %}

Notice that the speed value must be encoded as a string to keep our parser happy.


### Response

The new state of the processor:

{% highlight json %}
todo
{% endhighlight %}


### Protobuf

Request body is of type `Rest.PatchProcessorRequest`

{% highlight nginx %}
message PatchProcessorRequest {
  optional string state = 1;
  optional int64 seekTime = 2;
  optional string speed = 3;
}
{% endhighlight %}
