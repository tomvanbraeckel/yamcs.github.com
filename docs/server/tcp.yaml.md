---
layout: default
sidebar: yes
permalink: /docs/server/tcp.yaml/
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
