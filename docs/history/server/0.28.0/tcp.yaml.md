---
layout: default
sidebar: yes
version: 0.28.0
permalink: /docs/server/0.28.0/tcp.yaml/
---

<pre>
<code class="config-file">
#configuration for the TcpTmProvider and TcpUplinker 
# they look for properties like 
#spec:
#    tmHost: 
#    tmPort:
#    tcHost:
#    tcPort:
#    minimumTcPacketLength (by default 48)

local:
    tmHost: localhost
    tmPort: 10015
    tcHost: localhost
    tcPort: 10025
</code>
</pre>
