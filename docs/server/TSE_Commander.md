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

This service reads its configuration from a configuration file <tt>etc/tse.yaml</tt>. This file defines all the instruments that can be commanded.

### Telnet Interface

For debugging purposes, this service also starts a telnet server that allows to directly relay text-based commands to the configured instruments. This bypasses the TM/TC processing chain. Access this interface with an interactive TCP client such as <tt>telnet</tt> or <tt>netcat</tt>.

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
TODO
:tse:output:mode hex
:STATUS?
TODO
```

In this session we interacted with two different instruments (named <tt>rigol</tt> and <tt>tenma</tt>). The commands starting with <tt>:tse</tt> were directly interpreted by the TSE Commander, everything else was sent to the selected instrument.
