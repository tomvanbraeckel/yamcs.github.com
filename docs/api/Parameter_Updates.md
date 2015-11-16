---
layout: default
permalink: /docs/api/Parameter_Updates/
sidebar: yes
---

Subscribe to parameter updates:

{% highlight json %}
[ 1, 1, :seq, {
    "parameter": "subscribe",
    "data": {
        "list": [
            { "namespace": ":namespace", "name": ":name" }
        ]
    }
} ]
{% endhighlight %}
    
Subscribing is an additive operation, where new parameter IDs are appended to any existing subscription.    

### Example

Subscribe to BatteryVoltage1 through a qualified name, and BatteryVoltage2 using an OPS name:

{% highlight json %}
[ 1, 1, 789, {
    "parameter": "subscribe",
    "data": {
        "list": [
            { "name": "/YSS/SIMULATOR/BatteryVoltage1" },
            { "namespace": "MDB:OPS Name", "name": "SIMULATOR_BatteryVoltage2" }
        ]
    }
} ]
{% endhighlight %}

### Response

You first get an empty reply message confirming the positive receipt of your request:

{% highlight json %}
[ 1, 2, 789 ]
{% endhighlight %}
    
Further messages will be marked as type <tt>PARAMETER_DATA</tt>. Directly after you subscribe, you will receive the latest cached values  -- if applicable.

{% highlight json %}
todo
{% endhighlight %}


### Unsubscribe

Unsubscribe from all currently subscribed parameters:

{% highlight json %}
[ 1, 1, 790, { "parameter": "unsubscribe" } ]
{% endhighlight %}

This will be confirmed with an empty reply message:

{% highlight json %}
[ 1, 2, 790 ]
{% endhighlight %}
