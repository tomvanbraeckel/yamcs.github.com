---
layout: default
permalink: /docs/api/List_Tags/
sidebar: yes
---

List all tags for the given instance:

    GET /api/archive/:instance/tags

    
### Example

<pre class="header">
Status: 200 OK
</pre>

{% highlight json %}
{
  "tag" : [ {
    "id" : 1,
    "name" : "My annotation",
    "start" : 1449128432000,
    "stop" : 1449174255000,
    "description" : "blabla",
    "color" : "#ffc800"
  } ]
}
{% endhighlight %}


### Alternative Media Types

#### Protobuf

Use HTTP header:

    Accept: application/protobuf
    
Response is of type:

<pre class="r header"><a href="/docs/api/rest.proto/">rest.proto</a></pre>
{% highlight proto %}
message ListTagsResponse {
  repeated yamcs.ArchiveTag tag = 1;
}
{% endhighlight %}
