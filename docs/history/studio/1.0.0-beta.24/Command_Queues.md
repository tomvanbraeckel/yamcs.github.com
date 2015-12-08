---
layout: default
sidebar: yes
version: 1.0.0-beta.24
permalink: /docs/studio/1.0.0-beta.24/Command_Queues/
---

This view allows controlling the Yamcs queues from the point of view of Yamcs Server. With sufficient privileges, queues can be blocked or disabled.

![Command Queues](/assets/studio/command-queues.png){: .center-image }

The view is split into two panels:

* The upper panel contains a list with all the defined command queues. The queue name, the current state and the number of commands that are currently in the queue is displayed. Right-clicking on a command queue opens a menu with the possibility to change the state of the queue. 

    In addition to setting the new state of the queue, the following additional actions happen when changing the state of a blocked queue:
    
    * blocked &#8594; disabled: all the commands in the queue will be automatically rejected;
    * blocked &#8594; enabled: all the commands in the queue will be automatically sent.
    <br>

* The bottom panel contains the list of commands currently present in the queue that is selected in the upper panel. For each command the queue name, the command id, the user that has sent the command and the command string are displayed. The list is empty if the selected queue is not in the state blocked.

    Right-clicking on a command gives the possibility to **Send** or **Reject** the command.

