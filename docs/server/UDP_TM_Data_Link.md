---
layout: default
permalink: /docs/server/UDP_TM_Data_Link/
sidebar: yes
---

Listens on a UDP port for datagrams containing CCSDS packets. One datagram is equivalent to one packet.

### Class Name
{% javadoc org/yamcs/tctm/UdpTmDataLink %}

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
  <tr>
    <td class="code">maxLength</td>
    <td class="code">integer</td>
    <td>The maximum length of the packets received. If a larger datagram is received, the data will be truncated. Default: 1500 bytes</td>
  </tr>
  <tr>
    <td class="code">packetPreprocessorClassName</td>
    <td class="code">string</td>
    <td>
      Class name of a <a href="https://www.yamcs.org/yamcs/javadoc/index.html?org/yamcs/tctm/PacketPreprocessor.html"><tt>PacketPreprocessor</tt></a> implementation. Default is <a href="https://www.yamcs.org/yamcs/javadoc/index.html?org/yamcs/tctm/IssPacketPreprocessor.html"><tt>org.yamcs.tctm.IssPacketPreprocessor</tt></a> which applies ISS conventions.
    </td>
  </tr>
  <tr>
    <td class="code">packetPreprocessorArgs</td>
    <td class="code">map</td>
    <td>
      Optional args of arbitrary complexity to pass to the PacketPreprocessor. Each PacketPreprocessor may support different options.
    </td>
  </tr>
</table>
