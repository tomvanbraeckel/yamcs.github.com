---
layout: default
permalink: /docs/server/UDP_Parameter_Data_Link/
sidebar: yes
---

Listens on a UDP port for datagrams containing Protobuf encoded messages. One datagram is equivalent to a message of type [<tt>org.yamcs.protobuf.ParameterData</tt>](https://javadoc.io/page/org.yamcs/yamcs-api/latest/org/yamcs/protobuf/ParameterData.html)
.

### Class Name
[<tt>org.yamcs.tctm.UdpParameterDataLink</tt>](https://javadoc.io/page/org.yamcs/yamcs-core/latest/org/yamcs/tctm/UdpParameterDataLink.html)

### Configuration Options

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">port</td>
    <td class="code">integer</td>
    <td><b>Required.</b> The UDP port to listen on</td>
  </tr>
</table>
