---
layout: default
permalink: /docs/server/Local_Parameter_Manager/
sidebar: yes
---

Manages and provides local parameters.

### Class Name
{% javadoc org/yamcs/parameter/LocalParameterManager %}

### Configuration

This service is defined in <tt>etc/processor.yaml</tt>. Example:

{% yaml processor.yaml %}
realtime:
  services:
    - class: org.yamcs.parameter.LocalParameterManager
{% endyaml %}
