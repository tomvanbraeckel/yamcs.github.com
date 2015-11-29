---
layout: default
permalink: /docs/api/Edit_Queued_Command/
sidebar: yes
---

Edit a command queue entry:

    PATCH /api/processors/:instance/:processor/cqueues/:cqueue/entries/:uuid


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
    <td>The state of the entry. Either <tt>released</tt> or <tt>rejected</tt>.</td>
  </tr>
</table>

The same parameters can also be specified in the request body. In case both query string parameters and body parameters are specified, they are merged with priority being given to query string parameters.

### Example

Release an entry:

{% highlight json %}
{
  "state" : "released"
}
{% endhighlight %}

### Protobuf

#### Request

<pre class="r header"><a href="/docs/api/rest.proto/">rest.proto</a></pre>
{% highlight proto %}
message PatchCommandQueueEntryRequest {
  optional string state = 1;
}
{% endhighlight %}
