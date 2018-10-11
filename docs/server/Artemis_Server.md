---
layout: default
permalink: /docs/server/Artemis_Server/
sidebar: yes
---

Initializes and starts an embedded instance of the Artemis messaging server. This can be used to connect streams across Yamcs installations.

### Class Name
[<tt>org.yamcs.artemis.ArtemisServer</tt>](https://www.yamcs.org/yamcs/javadoc/org/yamcs/artemis/ArtemisServer.html)

### Configuration

This is a global service defined in <tt>etc/yamcs.yaml</tt>. Example from a typical deployment:

<pre class="r header">yamcs.yaml</pre>
```yaml
services:
  - class: org.yamcs.artemis.ArtemisServer
```

### Configuration Options

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">configFile</td>
    <td class="code">string</td>
    <td>
      Filename of the XML configuration file that contains further configuration options. Do not use an absolute path. The file must exist in the <tt>/opt/yamcs/etc</tt> folder. Default: <tt>artemis.xml</tt>.
    </td>
  </tr>
  <tr>
    <td class="code">securityManager</td>
    <td class="code">string</td>
    <td>Class name of a <tt>org.apache.activemq.artemis.spi.core.security.ActiveMQSecurityManager</tt> implementation. The implementation should have a no-arg constructor. If unspecified, security is not enabled.</td>
  </tr>
</table>
