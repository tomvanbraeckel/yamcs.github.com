---
layout: default
permalink: /docs/server/Artemis_TM_Data_Link/
sidebar: yes
---

Reads <tt>tm</tt> data from an Artemis queue and publishes it to the configured stream.

### Class Name
{% javadoc org/yamcs/tctm/ArtemisTmDataLink %}

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
    <td class="code">address</td>
    <td class="code">string</td>
    <td>
      Artemis address to bind to.
    </td>
  </tr>
  <tr>
    <td class="code">preserveIncomingReceptionTime</td>
    <td class="code">boolean</td>
    <td>
      When <tt>true</tt> incoming reception times are preserved. When <tt>false</tt> each packet is tagged with a fresh reception timestamp. Default: <tt>false</tt>
    </td>
  </tr>
</table>
