---
layout: default
permalink: /docs/api/Get_Parameter_Samples/
sidebar: yes
---

Sample the history of values for the specified parameter:

    GET /api/archive/:instance/parameters/:namespace/:name/samples


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
        <td>Filter the lower bound of the parameter's generation time. Specify a date string in ISO 8601 format</td>
    </tr>
    <tr>
        <td class="code">stop</td>
        <td class="code">string</td>
        <td>Filter the upper bound of the parameter's generation time. Specify a date string in ISO 8601 format</td>
    </tr>
    <tr>
        <td class="code">order</td>
        <td class="code">string</td>
        <td>The order of the returned results. Can be either <tt>asc</tt> or <tt>desc</tt>. Default: <tt>asc</tt></td>
    </tr>
</table>
 

### Response

<pre class="header">Status: 200 OK</pre>
{% highlight json %}
{
  "sample" : [ {
    "time" : "2015-11-11T09:11:37.626",
    "avg" : 169.41836734693865,
    "min" : 103.0,
    "max" : 237.0,
    "n" : 98
  } ]
}
{% endhighlight %}

### Alternative Media Types

#### Protobuf

Use HTTP header:

    Accept: application/protobuf
    
Response is of type:

<pre class="r header"><a href="/docs/api/pvalue.proto/">pvalue.proto</a></pre>
{% highlight proto %}
message TimeSeries {
  message Sample {
    optional string time = 1;
    optional double avg = 2;
    optional double min = 3;
    optional double max = 4;
    optional int32 n = 5;
  }

  repeated Sample sample = 1;
}
{% endhighlight %}
