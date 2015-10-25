---
layout: default
permalink: /docs/api/Create_a_Processor/
sidebar: yes
---

Create a processor for the given Yamcs instance:

    POST /api/:instance/processors


### Parameters

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">name</td>
    <td class="code">string</td>
    <td><strong>Required.</strong> The name of the processor. Must be unique for the Yamcs instance.</td>
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
