---
layout: default
sidebar: yes
permalink: /docs/server/logging.yamcs-server.properties/
---

This file is used to configure the standard Java logging framework, and is encoded in standard java properties format. The formatting of the java properties files is described at [http://docs.oracle.com/javase/6/docs/api/java/util/Properties.html#load(java.io.Reader)](http://docs.oracle.com/javase/6/docs/api/java/util/Properties.html#load(java.io.Reader))

<pre>
<code class="config-file">
handlers= java.util.logging.FileHandler, java.util.logging.ConsoleHandler

java.util.logging.FileHandler.level = ALL
java.util.logging.FileHandler.pattern = %h/.yamcs/log/yamcs-server.log
java.util.logging.FileHandler.limit = 20000000
java.util.logging.FileHandler.count = 50
java.util.logging.FileHandler.formatter = org.yamcs.CompactFormatter

java.util.logging.ConsoleHandler.level = WARNING
java.util.logging.ConsoleHandler.formatter = org.yamcs.CompactFormatter


org.yamcs.level=FINE
</code>
</pre>
