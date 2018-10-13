---
layout: default
permalink: /docs/server/UDP_Parameter_Data_Link/
sidebar: yes
---

Listens on a UDP port for datagrams containing Protobuf encoded messages. One datagram is equivalent to a message of
type
[<tt>org.yamcs.protobuf.Pvalue.ParameterData</tt>](https://www.yamcs.org/yamcs/javadoc/index.html?org/yamcs/protobuf/Pvalue.ParameterData.html)

### Class Name
[<tt>org.yamcs.tctm.UdpParameterDataLink</tt>](https://www.yamcs.org/yamcs/javadoc/index.html?org/yamcs/tctm/UdpParameterDataLink.html)

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
