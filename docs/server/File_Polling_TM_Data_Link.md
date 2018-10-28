---
layout: default
permalink: /docs/server/File_Polling_TM_Data_Link/
sidebar: yes
---

Reads data from files in a directory, importing it into the configured stream. The directory is polled regularly for new files and the files are imported one by one. After the import, the file is removed.

### Class Name
{% javadoc org/yamcs/tctm/FilePollingTmDataLink %}

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
    <td class="code">incomingDir</td>
    <td class="code">string</td>
    <td>
      The directory where the data will be read from. If not specified, the data will be read from <tt>&lt;yamcs-incoming-dir&gt;/&lt;instance&gt;/tm/</tt> where <tt>yamcs-incoming-dir</tt> is the value of the incomingDir property in <tt>etc/yamcs.yaml</tt>.
    </td>
  </tr>
  <tr>
    <td class="code">deleteAfterImport</td>
    <td class="code">boolean</td>
    <td>Remove the file after importing all the data. By default set to true, can be set to false to import the same data again and again.</td>
  </tr>
  <tr>
    <td class="code">delayBetweenPackets</td>
    <td class="code">integer</td>
    <td>When importing a file, wait this many milliseconds after each packet. This option together with the previous one can be used to simulate incoming realtime data.</td>
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
