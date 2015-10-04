---
layout: default
sidebar: yes
permalink: /docs/studio/Inspector_Windows/
---

Processed Variable or 'PV' is a term used by Yamcs Studio that covers the different types of data sources that a widget can be connected to. It is a more general term than parameter, which is a Yamcs Server notion. In Yamcs Studio there are other types of PVs than parameters.

PVs are uniquely identified by a <em>PV Name</em>. If multiple widgets have dependencies on the same PV, only one instance will be created and shared between these widgets.

The term PV is used to indicate both the name of a specific data source definition, as well as any instances of that definition. Context usually makes it apparent which of the two is meant.

A PV is considered <em>connected</em> if the data source is available, and at least one widget within Yamcs Studio is subscribing to it. As soon as no more widgets are connected to a PV, the PV gets <em>disconnected</em>.

<div class="hint">
    This last property currently has as a side effect that for example chart widgets lose their history when closing and reopening the containing display. We are aware of this, and have ideas on how to address this shortcoming.
</div>

* TOC
{:toc}

### PV Types
PVs always have a *name* uniquely identifying the specific data source. Depending on the type of PV, this name is prefixed with a different schema.

<table class="inline">
    <tr>
        <th>Schema</th>
        <th>PV Type</th>
    </tr>
    <tr>
        <td class="code">loc://</td>
        <td>Local PV</td>
    </tr>
    <tr>
        <td class="code">sim://</td>
        <td>Simulated PV</td>
    </tr>
    <tr>
        <td class="code">para://</td>
        <td>Yamcs Parameter</td>
    </tr>
    <tr>
        <td class="code">sw://</td>
        <td>Yamcs Software Parameter</td>
    </tr>
</table>

<div class="hint">
    While exploring existing displays you may sometimes notice widgets that are backed by a PV <em>without</em> a schema. By convention these are all resolved using the <tt>para://</tt> schema. Displays authors often choose not to specify this schema.
</div>  

#### Local PV
Local PVs are read and written entirely in a running Yamcs Studio instance. Local PVs are never communicated to Yamcs, nor to any other copies of Yamcs Studio. Local PVs are typically used by the display author as a means to store information that needs to be communicated from one widget to another. They also form a powerful building block when scripting advanced displays due to their ability to store runtime state. This makes it possible to script logic based on a historical window of values.

Local PVs are transient, and are reset when Yamcs Studio is restarted.

Example PV Names:

* todo

#### Parameter
Parameter PVs represent a readonly value that is provided by Yamcs. Typically this denotes telemetry.

The PV Name for parameters is the fully qualified XTCE name as specified in the Yamcs Mission Database.

Example PV Names:

* <tt>/YSS/SIMULATOR/BatteryVoltage1</tt><br>Short for <tt>para:///YSS/SIMULATOR/BatteryVoltage1</tt>
* <tt>/YSS/SIMULATOR/BatteryTemperature1</tt><br>Short for <tt>para:///YSS/SIMULATOR/BatteryTemperature1</tt>

In these examples <tt>YSS</tt> is the name of the root space system. <tt>SIMULATOR</tt> is the name of the space system directly below, which defines both measurements <tt>BatteryVoltage1</tt> and <tt>BatteryTemperature1</tt>.

#### Software Parameter
Same concept as a Parameter, but has additional support for writing values from the client to the server. In this regard they can be used as a means of communicating information from one client to another using Yamcs Server as the medium.

Remark that software parameters are not currently archived by Yamcs Server, and will therefore be reset when Yamcs is restarted.

#### Simulated Value
Locally generated functions. Mainly useful during testing, or in combination with other PVs using formulas.

### Formulas
PVs can be combined together using client-side formulas. Formulas always start with <tt>=</tt> followed by a formula expression. Expressions are similar to Excel formulas. 
