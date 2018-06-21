---
layout: default
permalink: /docs/server/TCP_TM_Data_Link/
sidebar: yes
---

Provides packets received via plain TCP sockets. The packets in CCSDS format are expected one after the other without any delimiter or separator (the length is deduced from the CCSDS header).

The specification consists of a name which selects a configuration defined in the file [etc/tcp.yaml](/docs/server/tcp.yaml/).

In case the TCP connection with the telemetry server cannot be opened or is broken, it retries to connect each 10 seconds.

### Class Name
[<tt>org.yamcs.tctm.TcpTmDataLink</tt>](https://javadoc.io/page/org.yamcs/yamcs-core/latest/org/yamcs/tctm/TcpTmDataLink.html)

### Configuration Options

<dl>
  <dt>host</dt>
  <dd><b>Required.</b> The host of the TM provider</dd>

  <dt>port</dt>
  <dd><b>Required.</b> The TCP port to connect to</dd>

  <dt>packetInputStreamClassName</dt>
  <dd>
    Class name of a <a href="https://javadoc.io/page/org.yamcs/yamcs-core/latest/org/yamcs/tctm/PacketInputStream.html">PacketInputStream</a> implementation. Default is <a href="https://javadoc.io/page/org.yamcs/yamcs-core/latest/org/yamcs/tctm/CcsdsPacketInputStream.html"><tt>org.yamcs.tctm.CcsdsPacketInputStream</tt></a> which reads CCSDS Packets.
  </dd>

  <dt>packetInputStreamArgs</dt>
  <dd>
    Optional args of arbitrary complexity to pass to the PacketInputStream. Each PacketInputStream may support different options.
  </dd>

  <dt>packetPreprocessorClassName</dt>
  <dd>
    Class name of a <a href="https://javadoc.io/page/org.yamcs/yamcs-core/latest/org/yamcs/tctm/PacketPreprocessor.html">PacketPreprocessor</a> implementation. Default is <a href="https://javadoc.io/page/org.yamcs/yamcs-core/latest/org/yamcs/tctm/IssPacketPreprocessor.html"><tt>org.yamcs.tctm.IssPacketPreprocessor</tt></a> which applies ISS conventions.
  </dd>

  <dt>packetPreprocessorArgs</dt>
  <dd>
    Optional args of arbitrary complexity to pass to the PacketPreprocessor. Each PacketPreprocessor may support different options.
  </dd>
</dl>
