---
layout: default
permalink: /docs/server/Artemis_Parameter_Publisher/
sidebar: yes
---

Publish <tt>param</tt> stream data to an Artemis broker.

### Class Name
{% javadoc 'org/yamcs/artemis/ArtemisPpService' %}

### Configuration

This service is defined in <tt>etc/yamcs.(instance).yaml</tt>. Example from a typical deployment:

{% yaml yamcs.simulator.yaml %}
services:
  - class: org.yamcs.artemis.ArtemisPpService
    args: [pp_realtime, pp_dump, sys_param]
{% endyaml %}

<tt>args</tt> must be a an array of strings indicating which streams to publish. For each stream the target address is composed as `instance.stream`. In the example tuples from the streams <tt>pp_realtime</tt>, <tt>pp_dump</tt> and <tt>pp_dump</tt> are published to the addresses <tt>simulator.pp_realtime</tt>, <tt>simulator.pp_dump</tt> and <tt>simulator.pp_sys_param</tt> respectively.

By default, messages are published to an embedded broker (in-VM). This assumes that [Artemis Server](../Artemis_Server/) was configured as a global service. In order to use an external broker you can configure the property <tt>artemisUrl</tt> in either <tt>etc/yamcs.(instance).yaml</tt> or <tt>etc/yamcs.yaml</tt>:

{% yaml yamcs.simulator.yaml %}
artemisUrl: tcp://remote-host1:5445
{% endyaml %}

{% yaml yamcs.yaml %}
artemisUrl: tcp://remote-host1:5445
{% endyaml %}

If defined, the instance-specific configuration is selected over the global configuration. The URL format follows Artemis conventions and is not further detailed in this manual.
