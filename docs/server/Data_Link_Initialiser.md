---
layout: default
permalink: /docs/server/Data_Link_Initialiser/
sidebar: yes
---

Activates the data links during Yamcs start-up and creates all the needed streams.

### Configuration

This service is defined in <tt>etc/yamcs.(instance).yaml</tt>. Example from a typical deployment:

<pre class="r header">yamcs.simulator.yaml</pre>
```yaml
services:
  - org.yamcs.tctm.DataLinkInitialiser
```

Data link configuration is detailed further in [Data Links](/docs/server/Data_Links).
