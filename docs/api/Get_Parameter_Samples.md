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
 

### Media Type

In addition to the usual support for JSON and Protobuf, the response for this particular resource can be made to output CSV data by setting the HTTP `Accept` header to `text/csv`.


### Response

### Protobuf

Response:

<pre class="header">pvalue.proto</pre>
{% highlight nginx %}
message SampleSeries {
  message Sample {
    optional int64 averageGenerationTime = 1;
    optional string averageGenerationTimeUTC = 2;
    optional double averageValue = 3;
    optional double lowValue = 4;
    optional double highValue = 5;
    optional int32 n = 6;
  }

  repeated Sample sample = 1;
}
{% endhighlight %}
