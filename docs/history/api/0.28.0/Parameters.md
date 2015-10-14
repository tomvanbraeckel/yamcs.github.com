---
layout: default
version: 0.28.0
permalink: /docs/api/0.28.0/Parameters/
sidebar: yes
---

### Retrieve multiple parameters `/parameter/_get`

By default, the parameters are returned after they have been freshly updated (i.e. no cache). 
The timeout option indicates how long should wait until the call shall return (with partial or no data).
Instead of the timeout, the `fromCache:true` can be used to retrieve parameters from cache (if available). See [[Parameter Cache]] for description on how to configure YProcessor parameter cache.


```
curl -XGET http://localhost:8090/simulator/api/parameter/_get?pretty -d '
  {
    "list": [
      {"name":"/YSS/SIMULATOR/Longitude"},
      {"name":"/YSS/SIMULATOR/Latitude"},
      {"name":"/YSS/SIMULATOR/Altitude"}]
     ,"timeout":2000}
  }'
```

{% highlight json %}
{
  "parameter" : [ {
    "id" : {
      "name" : "/SIMULATOR/SIMULATOR/Longitude"
    },
    "rawValue" : {
      "type" : 0,
      "floatValue" : -60.55
    },
    "engValue" : {
      "type" : 0,
      "floatValue" : -60.55
    },
    "acquisitionTime" : 1429799497246,
    "generationTime" : 1429799481242,
    "acquisitionStatus" : 0,
    "processingStatus" : true,
    "monitoringResult" : 1,
    "acquisitionTimeUTC" : "2015-04-23T14:31:02.246",
    "generationTimeUTC" : "2015-04-23T14:30:46.242"
  }, {
    "id" : {
      "name" : "/SIMULATOR/SIMULATOR/Latitude"
    },
    "rawValue" : {
      "type" : 0,
      "floatValue" : 53.3
    },
    "engValue" : {
      "type" : 0,
      "floatValue" : 53.3
    },
    "acquisitionTime" : 1429799497246,
    "generationTime" : 1429799481242,
    "acquisitionStatus" : 0,
    "processingStatus" : true,
    "monitoringResult" : 1,
    "acquisitionTimeUTC" : "2015-04-23T14:31:02.246",
    "generationTimeUTC" : "2015-04-23T14:30:46.242"
  }, {
    "id" : {
      "name" : "/SIMULATOR/SIMULATOR/Altitude"
    },
    "rawValue" : {
      "type" : 0,
      "floatValue" : 39759.0
    },
    "engValue" : {
      "type" : 0,
      "floatValue" : 39759.0
    },
    "acquisitionTime" : 1429799497246,
    "generationTime" : 1429799481242,
    "acquisitionStatus" : 0,
    "processingStatus" : true,
    "monitoringResult" : 1,
    "acquisitionTimeUTC" : "2015-04-23T14:31:02.246",
    "generationTimeUTC" : "2015-04-23T14:30:46.242"
  } ]
}
{% endhighlight %}

### Retrieve single parameter `/parameter/parameter_fqname`
```
curl -XGET http://localhost:8090/simulator/api/parameter/YSS/SIMULATOR/BatteryVoltage2?pretty
```

{% highlight json %}
{
  "id" : {
    "name" : "/YSS/SIMULATOR/BatteryVoltage2"
  },
  "rawValue" : {
    "type" : 2,
    "uint32Value" : 244
  },
  "engValue" : {
    "type" : 2,
    "uint32Value" : 244
  },
  "acquisitionTime" : 1429801967511,
  "generationTime" : 1429801951507,
  "acquisitionStatus" : 0,
  "processingStatus" : true,
  "monitoringResult" : 1,
  "acquisitionTimeUTC" : "2015-04-23T15:12:12.511",
  "generationTimeUTC" : "2015-04-23T15:11:56.507"
}
{% endhighlight %}



### Set multiple parameters `/parameter/_set`


### Set single parameter
POST /parameter/_set

