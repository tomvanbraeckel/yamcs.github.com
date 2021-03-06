---
layout: default
permalink: /docs/server/Algorithm_Manager/
sidebar: yes
---

Executes algorithms and provides output parameters.

### Class Name
{% javadoc org/yamcs/algorithms/AlgorithmManager %}

### Configuration

This service is defined in <tt>etc/processor.yaml</tt>. Example:

{% yaml processor.yaml %}
realtime:
  services:
    - class: org.yamcs.algorithms.AlgorithmManager
      args:
        libraries:
          JavaScript:
            - "mdb/mylib.js"
{% endyaml %}

### Configuration Options

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">libraries</td>
    <td class="code">map</td>
    <td>Libraries to be included in algorithms. The map points from the scripting language to a list of file paths.</td>
  </tr>
</table>
