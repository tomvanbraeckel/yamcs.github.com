---
layout: default
sidebar: yes
permalink: /docs/studio/Data_Links/
---

This view provides an overview of the data links of a running Yamcs server.

Data links represent input or output flows to Yamcs. There are three types of Data Links: TM (called TM Providers), TC (called TC Uplinkers) and PP (called PP Providers). TM and PP receive telemetry packets or parameters and inject them into the realtime or dump TM or PP streams. The TC data links subscribe to the realtime TC stream and send data to external systems.

There are different types of providers. For details refer to the [Yamcs Server Manual](/docs/server/).

![Data Links](/assets/studio/data-links.png){: .center-image }

The presented information includes:

<table class="inline">
    <tr>
        <th>Name</th>
        <td>Identifier of this link as assigned by Yamcs</td>
    </tr>
    <tr>
        <th>Type</th>
        <td>The type of this link. For example, TcpTmProvider represents an input of TM over TCP</td>
    </tr>
    <tr>
        <th>Spec</th>
        <td>Configuration information passed to the provider instance. Significance depends on the type of provider</td>
    </tr>
    <tr>
        <th>Stream</th>
        <td>
            The internal stream where the data is either:
            <ul>
                <li>sourced from (in the case of uplinkers), or</li>
                <li>published to (in the case of providers)</li>
            </ul>
            It is perfectly valid for different providers or uplinkers to use the same stream.
        </td>
    </tr>
    <tr>
        <th>Status</th>
        <td>
            The status of this link. One of:
            <ul>
                <li><tt>OK</tt> &ndash; if the link is alive</li>
                <li><tt>DISABLED</tt> &ndash; if the link was disabled</li>
                <li><tt>UNAVAIL</tt> &ndash; if the link is enabled, but not available</li>
            </ul>
            The <tt>Status</tt> background lights bright green if the data count increased within the last 1500 milliseconds. 
        </td>
    </tr>
    <tr>
        <th>Data Count</th>
        <td>
            The number of data elements (e.g. packets) that this link published or received from its stream since Yamcs started running.
        </td>
    </tr>
</table>

With sufficient privileges, you can enable or disable a link manually by right-clicking the applicable row and selecting **Enable Link** or **Disable Link**.
