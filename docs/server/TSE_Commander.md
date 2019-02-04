---
layout: default
permalink: /docs/server/TSE_Commander/
sidebar: yes
---

This service allows dispatching commands to Test Support Equipment (TSE). The instrument must have a remote control interface (Serial, TCP/IP) and should support a text-based command protocol such as SCPI.

### Class Name
{% javadoc org/yamcs/tse/TseCommander %}

### Configuration

This is a global service defined in <tt>etc/yamcs.yaml</tt>. Example from a typical deployment:

{% yaml yamcs.yaml %}
services:
  - class: org.yamcs.tse.TseCommander
{% endyaml %}

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

This service reads further configuration options from a file <tt>etc/tse.yaml</tt>. This file defines all the instruments that can be commanded. Example:

{% yaml tse.yaml %}
instruments:
  - name: tenma
    class: org.yamcs.tse.SerialPortDriver
    args:
      path: /dev/tty.usbmodem14141
      # Note: this instrument does not terminate responses.
      # Use a very short timeout to compensate (still within spec)
      # responseTermination: "\n"
      responseTimeout: 100

  - name: simulator
    class: org.yamcs.tse.TcpIpDriver
    args:
      host: localhost
      port: 10023
      responseTermination: "\r\n"

  - name: rigol
    class: org.yamcs.tse.TcpIpDriver
    args:
      host: 192.168.88.185
      port: 5555
      responseTermination: "\n"
{% endyaml %}

There are two types of drivers. Both drivers support these base arguments:

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">responseTermination</td>
    <td class="code">string</td>
    <td>The character(s) by which the instrument delimits distinct responses. Typicall <tt>\n</tt> or <tt>\r\n</tt>. This may be left unspecified if the instrument does not delimit responses.</td>
  </tr>
  <tr>
    <td class="code">commandSeparation</td>
    <td class="code">string</td>
    <td>The character(s) that indicates when the command will generate multiple <em>distinct</em> responses (delimited by <tt>responseTermination</tt>). For most instruments this should be left unspecified.</td>
  </tr>
  <tr>
    <td class="code">responseTimeout</td>
    <td class="code">integer</td>
    <td>Timeout in milliseconds for a response to arrive. Default: <tt>3000</tt></td>
  </tr>
</table>

In addition each driver supports driver-specific arguments:

#### TCP/IP

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">host</td>
    <td class="code">string</td>
    <td><strong>Required. </strong> The host of the instrument.</td>
  </tr>
  <tr>
    <td class="code">port</td>
    <td class="code">integer</td>
    <td><strong>Required. </strong> The TCP port to connect to.</td>
  </tr>
</table>

#### Serial Port

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">path</td>
    <td class="code">string</td>
    <td><strong>Required. </strong> Path to the device.</td>
  </tr>
  <tr>
    <td class="code">baudrate</td>
    <td class="code">number</td>
    <td>The baud rate for this serial port. Default: 9600</td>
  </tr>
  <tr>
    <td class="code">dataBits</td>
    <td class="code">number</td>
    <td>The number of data bits per word. Default: 8</td>
  </tr>
  <tr>
    <td class="code">parity</td>
    <td class="code">string</td>
    <td>The parity error-detection scheme. One of <tt>odd</tt> or <tt>even</tt>. By default parity is not set.</td>
  </tr>
</table>

### Mission Database

The definition of TSE string commands is done in XTCE space systems resorting under <tt>/TSE</tt>. The <tt>/TSE</tt> node is added by defining {% javadoc org/yamcs/xtce/TseLoader %} in the MDB loader tree. Example:


{% yaml yamcs.simulator.yaml %}
mdb:
  - type: org.yamcs.xtce.TseLoader
    subLoaders:
      - type: sheet
        spec: mdb/tse/simulator.xls
{% endyaml %}

The instrument name in <tt>etc/tse.yaml</tt> should match with the name of the a sub space system of /TSE.

The definition of commands and their arguments follows the same approach as non-TSE commands but with some particularities:

* Each command should have either <tt>QUERY</tt> or <tt>COMMAND</tt> as its parent. These abstract commands are defined by the {% javadoc org/yamcs/xtce/TseLoader %}.

  * <tt>QUERY</tt> commands send a text command to the remote instrument and expect a text response. The argument assignments <tt>command</tt> and <tt>response</tt> must both be set to a string template that matches what the instrument expects and returns.

  * <tt>COMMAND</tt> commands send a text command to the remote instrument, but no response is expected (or it is simply ignored). Only the argument assignment <tt>command</tt> must be set to a string template matching what the instrument expects.

* Each TSE command may define additional arguments needed for the specific command. In the definition of the <tt>command</tt> and <tt>response</tt> string templates you can refer to the value of these arguments by enclosing the argument name in angle brackets. Example: an argument <tt>n</tt> can be dynamically substituted in the string command by referring to it as <tt>&lt;n&gt;</tt>.

* Additionally you can instruct Yamcs to extract one or more parameter values out of instrument response for a particular command by referring to the parameter name enclosed with backticks. This parameter should be defined in the same space system as the command and use the non-qualified name. The raw type of these parameters should be string.

To illustrate these concepts with an example, consider this query command defined in the space system <tt>/TSE/simulator</tt>:

<table class="inline">
<tr>
<th>Command name</th>
<th>Parent</th>
<th>Assignments</th>
<th>Arguments</th>
</tr>
<tr>
<td>get_identification</td>
<td>QUERY</td>
<td>
<ul>
<li>command=*IDN?</li>
<li>response=`identification`</li>
</ul>
</td>
<td></td>
</tr>
</table>

When issued, this command will send the string <tt>*IDN?</tt> to the instrument named <tt>simulator</tt>. A string response is expected and is read in its entirity as a value of the parameter <tt>/TSE/simulator/identification</tt>.

The next example shows the definition of a TSE command that uses a dynamic argument in both the command and the response string templates:

<table class="inline">
<tr>
<th>Command name</th>
<th>Parent</th>
<th>Assignments</th>
<th>Arguments</th>
</tr>
<tr>
<td>get_battery_voltage</td>
<td>QUERY</td>
<td>
<ul>
<li>command=:BATTERY&lt;n&gt;:VOLTAGE?</li>
<li>response=`battery_voltage&lt;n&gt;`</li>
</ul>
</td>
<td>n (range 1-3)</td>
</tr>
</table>

When issued with the argument <tt>2</tt>, Yamcs will send the string <tt>:BATTERY2:VOLTAGE?</tt> to the remote instrument and read back the response into the parameter <tt>/TSE/simulator/battery_voltage2</tt>. In this simple case you could alternatively have defined three distinct commands without arguments (one for each battery).

{% hint %}
When using the option <tt>commandSeparation</tt>, the <tt>response</tt> argument of the command template should use the same separator between the expected responses. For example a query of <tt>:DATE?;:TIME?</tt> with command separator <tt>;</tt> may be matched in the MDB using the pattern: <tt>&#96;date_param&#96;;&#96;time_param&#96;</tt> (regardless of the termination character).
{% endhint %}

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
