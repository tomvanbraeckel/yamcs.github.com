---
layout: default
permalink: /docs/server/Artemis_TM_Publisher/
sidebar: yes
---

Publish <tt>tm</tt> stream data to an Artemis broker.

### Class Name
{% javadoc org/yamcs/artemis/ArtemisTmService %}

### Configuration

This service is defined in <tt>etc/yamcs.(instance).yaml</tt>. Example from a typical deployment:

{% yaml yamcs.simulator.yaml %}
services:
  - class: org.yamcs.artemis.ArtemisTmService
    args: [tm_realtime, tm_dump]
{% endyaml %}

<tt>args</tt> must be a an array of strings indicating which streams to publish. For each stream the target address is composed as `instance.stream`. In the example tuples from the streams <tt>tm_realtime</tt> and <tt>tm_dump</tt> are published to the addresses <tt>simulator.tm_realtime</tt> and <tt>simulator.tm_dump</tt> respectively.

By default, messages are published to an embedded broker (in-VM). This assumes that [Artemis Server](../Artemis_Server/) was configured as a global service. In order to use an external broker you can configure the property <tt>artemisUrl</tt> in either <tt>etc/yamcs.(instance).yaml</tt> or <tt>etc/yamcs.yaml</tt>:

{% yaml yamcs.simulator.yaml %}
artemisUrl: tcp://remote-host1:5445
{% endyaml %}

{% yaml yamcs.yaml %}
artemisUrl: tcp://remote-host1:5445
{% endyaml %}

If defined, the instance-specific configuration is selected over the global configuration. The URL format follows Artemis conventions and is not further detailed in this manual.
