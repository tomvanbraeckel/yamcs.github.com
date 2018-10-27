---
layout: default
permalink: /docs/server/TCP_TM_Data_Link/
sidebar: yes
---

Provides packets received via plain TCP sockets.

In case the TCP connection with the telemetry server cannot be opened or is broken, it retries to connect each 10 seconds.

### Class Name
{% javadoc 'org/yamcs/tctm/TcpTmDataLink' %}

### Configuration Options

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">host</td>
    <td class="code">string</td>
    <td><b>Required.</b> The host of the TM provider</td>
  </tr>
  <tr>
    <td class="code">port</td>
    <td class="code">integer</td>
    <td><b>Required.</b> The TCP port to connect to</td>
  </tr>
  <tr>
    <td class="code">stream</td>
    <td class="code">string</td>
    <td><b>Required.</b> The stream where data is emitted</td>
  </tr>
  <tr>
    <td class="code">packetInputStreamClassName</td>
    <td class="code">string</td>
    <td>
      Class name of a <a href="https://www.yamcs.org/yamcs/javadoc/index.html?org/yamcs/tctm/PacketInputStream.html"><tt>PacketInputStream</tt></a> implementation. Default is <a href="https://www.yamcs.org/yamcs/javadoc/index.html?org/yamcs/tctm/CcsdsPacketInputStream.html"><tt>org.yamcs.tctm.CcsdsPacketInputStream</tt></a> which reads CCSDS Packets.
    </td>
  </tr>
  <tr>
    <td class="code">packetInputStreamArgs</td>
    <td class="code">map</td>
    <td>
      Optional args of arbitrary complexity to pass to the PacketInputStream. Each PacketInputStream may support different options.
    </td>
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
