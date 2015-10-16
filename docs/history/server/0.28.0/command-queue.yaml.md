---
layout: default
sidebar: yes
version: 0.28.0
permalink: /docs/server/0.28.0/command-queue.yaml/
---

<pre>
<code class="config-file">
# Definitions of command queues
# Eeach queue has a name, a default state and a list of roles
# There are three possibile states: 
#   - enabled means the commands are sent immediately
#   - blocked means the commands are accepted into the queue but need to be 
#     manually sent 
#   - disabled means the commands are rejected 
# There is always a commandqueue called "default". It can be  redefined here
# in order to have a different state
# If a command comes from a user which is not defined by any other queue, 
#   it is put into the default queue 

queueNames: [ops, uhb]

ops:
    state: enabled
    significances: [none]
    roles: [Operator]

ops-critic:
    state: enabled
    significances: [watch, warning, distress, critical, severe]
    stateExpirationTimeS: 300
    roles: [Operator]

uhb:
    state: disabled
    roles: [UHB-Operator]
</code>
</pre>
