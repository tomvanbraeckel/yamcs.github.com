---
layout: default
permalink: /docs/server/TCP_TC_Data_Link/
sidebar: yes
---

Sends telecommands via TCP.

### Class Name
[<tt>org.yamcs.tctm.TcpTcDataLink</tt>](https://javadoc.io/page/org.yamcs/yamcs-core/latest/org/yamcs/tctm/TcpTcDataLink.html)


### Configuration Options

<dl>
  <dt>host</dt>
  <dd><b>Required.</b> The host of the TC provider</dd>

  <dt>port</dt>
  <dd><b>Required.</b> The TCP port to connect to</dd>

  <dt>tcQueueSize</dt>
  <dd>Limit the size of the queue. Default: unlimited</dd>

  <dt>tcMaxRate</dt>
  <dd>Ensure that on overage no more than <tt>tcMaxRate</tt> commands are issued during any given second. Default: unspecified</dd>

  <dt>commandPostprocessorClassName</dt>
  <dd>
    Class name of a <a href="https://javadoc.io/page/org.yamcs/yamcs-core/latest/org/yamcs/tctm/CommandPostprocessor.html">CommandPostprocessor</a> implementation. Default is <a href="https://javadoc.io/page/org.yamcs/yamcs-core/latest/org/yamcs/tctm/IssCommandPostprocessor.html"><tt>org.yamcs.tctm.IssCommandPostProcessor</tt></a> which applies ISS conventions.
  </dd>

  <dt>commandPostprocessorArgs</dt>
  <dd>
    Optional args of arbitrary complexity to pass to the CommandPostprocessor. Each CommandPostprocessor may support different options.
  </dd>
</dl>
