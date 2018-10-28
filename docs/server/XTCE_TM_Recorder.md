---
layout: default
permalink: /docs/server/XTCE_TM_Recorder/
sidebar: yes
---

Records XTCE TM sequence containers. This service stores the data coming from one or more streams into a table <tt>tm</tt>.

### Class Name
{% javadoc 'org/yamcs/archive/XtceTmRecorder' %}

### Configuration

This service is defined in <tt>etc/yamcs.(instance).yaml</tt>. Example from a typical deployment:

{% yaml yamcs.simulator.yaml %}
services:
  - class: org.yamcs.archive.XtceTmRecorder

streamConfig:
  tm:
    - tm_realtime
    - tm_dump
{% endyaml %}

With this configuration containers coming from both the tm_realtime and tm_dump streams are stored into the table <tt>tm</tt>.

### Configuration Options

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">streams</td>
    <td class="code">list of strings</td>
    <td>The streams to record. When unspecified, all <tt>tm</tt> streams defined in <tt>streamConfig</tt> are recorded.</td>
  </tr>
</table>
