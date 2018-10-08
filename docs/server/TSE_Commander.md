---
layout: default
permalink: /docs/server/TSE_Commander/
sidebar: yes
---

This service allows dispatching commands to Test Support Equipment (TSE). The instrument must have a remote control interface (Serial, TCP/IP) and should support a text-based command protocol such as SCPI.

### Class Name
[<tt>org.yamcs.tse.TseCommander</tt>](https://javadoc.io/page/org.yamcs/yamcs-tse/latest/org/yamcs/tse/TseCommander.html)

### Configuration

This is a global service defined in <tt>etc/yamcs.yaml</tt>. Example from a typical deployment:

<pre class="r header">yamcs.yaml</pre>
```yaml
services:
  - class: org.yamcs.tse.TseCommander
```

### Configuration Options

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">telnet</td>
    <td class="code">map</td>
    <td><strong>Required. </strong> Configure Telnet properties.<br>Example: <tt>{ port: 8023 }</tt></td>
  </tr>
  <tr>
    <td class="code">tc</td>
    <td class="code">map</td>
    <td><strong>Required. </strong> Configure properties of the TC link.<br>Example: <tt>{ port: 8135 }</tt></td>
  </tr>
  <tr>
    <td class="code">tm</td>
    <td class="code">map</td>
    <td><strong>Required. </strong> Configure properties of the TM link.<br>Example: <tt>{ host: localhost, port: 31002 }</tt></td>
  </tr>
</table>

This service reads further configuration options from a file <tt>etc/tse.yaml</tt>. This file defines all the instruments that can be commanded.

### Telnet Interface

For debugging purposes, this service starts a telnet server that allows to directly relay text-based commands to the configured instruments. This bypasses the TM/TC processing chain. Access this interface with an interactive TCP client such as <tt>telnet</tt> or <tt>netcat</tt>.

The server adds additional SCPI-like commands which allow to switch to any of the configured instruments in a single session. This is best explained via an example:

```
$ nc localhost 8023
:tse:instrument rigol
*IDN?
RIGOL TECHNOLOGIES,DS2302A,DS2D155201382,00.03.00
:cal:date?;time?
2018,09,14;21,33,41
:tse:instrument tenma
*IDN?
TENMA72-2540V2.0
VOUT1?
00.00
:tse:output:mode hex
VOUT1?
30302E3030
```

In this session we interacted with two different instruments (named <tt>rigol</tt> and <tt>tenma</tt>). The commands starting with <tt>:tse</tt> were directly interpreted by the TSE Commander, everything else was sent to the selected instrument.
