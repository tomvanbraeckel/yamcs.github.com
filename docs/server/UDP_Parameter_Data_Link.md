---
layout: default
permalink: /docs/server/UDP_Parameter_Data_Link/
sidebar: yes
---

Listens on a UDP port for datagrams containing Protobuf encoded messages. One datagram is equivalent to a message of
type {% javadoc 'org/yamcs/protobuf/Pvalue.ParameterData' %}

### Class Name
{% javadoc 'org/yamcs/tctm/UdpParameterDataLink' %}

### Configuration Options

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">stream</td>
    <td class="code">string</td>
    <td><b>Required.</b> The stream where data is emitted</td>
  </tr>
  <tr>
    <td class="code">port</td>
    <td class="code">integer</td>
    <td><b>Required.</b> The UDP port to listen on</td>
  </tr>
</table>
