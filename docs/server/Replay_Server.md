---
layout: default
permalink: /docs/server/Replay_Server/
sidebar: yes
---

This service handles replay requests of archived data. Each replay runs with a separate processor that runs in parallel to the realtime processing.

### Class Name
{% javadoc org/yamcs/archive/ReplayServer %}

### Configuration

This service is defined in <tt>etc/yamcs.(instance).yaml</tt>. Example from a typical deployment:

{% yaml yamcs.simulator.yaml %}
services:
  - class: org.yamcs.archive.ReplayServer
{% endyaml %}
