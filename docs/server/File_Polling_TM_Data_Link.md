---
layout: default
permalink: /docs/server/File_Polling_TM_Data_Link/
sidebar: yes
---

Reads data from files in a directory, importing it into the configured stream. The directory is polled regularly for new files and the files are imported one by one. After the import, the file is removed.

### Class Name
[<tt>org.yamcs.tctm.FilePollingTmDataLink</tt>](https://javadoc.io/page/org.yamcs/yamcs-core/latest/org/yamcs/tctm/FilePollingTmDataLink.html)

### Configuration Options

<dl>
  <dt><tt>incomingDir</tt></dt>
  <dd>
    The directory where the data will be read from. If not specified, the data will be read from <tt>&lt;yamcs-incoming-dir&gt;/&lt;instance&gt;/tm/</tt> where <tt>yamcs-incoming-dir</tt> is the value of the incomingDir property in <tt>etc/yamcs.yaml</tt>.
  </dd>

  <dt><tt>deleteAfterImport</tt></dt>
  <dd>Remove the file after importing all the data. By default set to true, can be set to false to import the same data again and again.</dd>

  <dt><tt>delayBetweenPackets</tt></dt>
  <dd>When importing a file, wait this many milliseconds after each packet. This option together with the previous one can be used to simulate incoming realtime data.</dd>

  <dt>packetPreprocessorClassName</dt>
  <dd>
    Class name of a <a href="https://javadoc.io/page/org.yamcs/yamcs-core/latest/org/yamcs/tctm/PacketPreprocessor.html">PacketPreprocessor</a> implementation. Default is <a href="https://javadoc.io/page/org.yamcs/yamcs-core/latest/org/yamcs/tctm/IssPacketPreprocessor.html"><tt>org.yamcs.tctm.IssPacketPreprocessor</tt></a> which applies ISS conventions.
  </dd>

  <dt>packetPreprocessorArgs</dt>
  <dd>
    Optional args of arbitrary complexity to pass to the PacketPreprocessor. Each PacketPreprocessor may support different options.
  </dd>
</dl>
