---
layout: default
sidebar: yes
permalink: /docs/server/yamcs-server_init_script/
---

Yamcs distributions include an init script for starting and stopping Yamcs Server in System V-style.

This script is located at <tt>/etc/init.d/yamcs-server</tt> and should not be run directly but instead via your system's service manager. This will perform proper stepdown to the <tt>yamcs</tt> user.

For example:

    systemd start|stop|restart|status yamcs-server

Or alternatively:

    service yamcs-server start|stop|restart|status


The init script accepts these commands:

<dl>
    <dt class="code">start</dt>
    <dd>
        Starts Yamcs Server and stores the PID of the yamcsd process to <tt>/var/run/yamcs-server.pid</tt>
    </dd>
    <dt class="code">stop</dt>
    <dd>
        Stops the Yamcs Server process based on the PID found in <tt>/var/run/yamcs-server.pid</tt>
    </dd>
    <dt class="code">restart</dt>
    <dd>
        Stops Yamcs Server if it is running, then starts it again.
    </dd>
    <dt class="code">status</dt>
    <dd>
        Checks if Yamcs Server is currently running. This does a PID check and will not detect a Yamcs Server runtime that has been started on the system without use of this init script.
    </dd>
</dl>
