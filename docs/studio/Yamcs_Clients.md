---
layout: default
sidebar: yes
permalink: /docs/studio/Yamcs_Clients/
---

The Yamcs Clients view is a read-only view that shows you all the clients that are connected to the same Yamcs Server that you are connected to.

![Yamcs Clients](/assets/studio/yamcs-clients.png){: .center-image }

The displayed information includes:

<table class="inline">
    <tr>
        <th>ID</th>
        <td>The client ID assigned by Yamcs Server. Useful for debugging.</td>
    </tr>
    <tr>
        <th>User</th>
        <td>The name of the connected user, or <tt>unknown</tt> if Yamcs was not secured</td>
    </tr>
    <tr>
        <th>Application</th>
        <td>The name of the application that the user is using to connect to Yamcs.</td>
    </tr>
    <tr>
        <th>Instance</th>
        <td>The instance this user is connected to</td>
    </tr>
    <tr>
        <th>Processor</th>
        <td>The processor this user is connected to</td>
    </tr>
</table>
