---
layout: default
permalink: /docs/api/Web_API_Configuration/
sidebar: yes
---

In `yamcs.yaml` define the exposed port. Traffic on this port is multiplexed between web tools such as the [REST API](/docs/api/REST_API), the [WebSocket API](/docs/api/WebSocket_API) and the web displays.

{% highlight yaml %}
webPort: 80902
{% endhighlight %}

In `yamcs.(instance).yaml` activate the `YamcsWebService`.

{% highlight yaml %}
services:
      - [...]
      - org.yamcs.web.YamcsWebService
{% endhighlight %}
