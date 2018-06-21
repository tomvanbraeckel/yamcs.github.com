---
layout: default
permalink: /docs/server/Artemis_TM_Data_Link/
sidebar: yes
---

Reads data from an Artemis queue.

### Class Name
[<tt>org.yamcs.tctm.ArtemisTmDataLink</tt>](https://javadoc.io/page/org.yamcs/yamcs-core/latest/org/yamcs/tctm/ArtemisTmDataLink.html)

### Configuration Options

<dl>
  <dt><tt>address</tt></dt>
  <dd>
    Artemis address to bind to.
  </dd>
  <dt><tt>preserveIncomingReceptionTime</tt></dt>
  <dd>
    When <tt>true</tt> incoming reception times are preserved. When <tt>false</tt> each packet is tagged with a fresh reception timestamp. Default: <tt>false</tt>
  </dd>
</dl>
