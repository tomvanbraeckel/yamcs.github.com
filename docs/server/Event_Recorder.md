---
layout: default
permalink: /docs/server/Event_Recorder/
sidebar: yes
---

Records events. This service stores the data coming from one or more streams into a table <tt>events</tt>.

### Class Name
{% javadoc 'org/yamcs/archive/EventRecorder' %}

### Configuration

This service is defined in <tt>etc/yamcs.(instance).yaml</tt>. Example from a typical deployment:

{% yaml yamcs.simulator.yaml %}
services:
  - class: org.yamcs.archive.EventRecorder

streamConfig:
  event:
    - events_realtime
    - events_dump
{% endyaml %}

With this configuration events emitted to the <tt>events_realtime</tt> or <tt>events_dump</tt> stream are stored into the table <tt>events</tt>.
