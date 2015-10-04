---
layout: default
sidebar: yes
permalink: /docs/tools/Yamcs_Monitor/
---

Yamcs Monitor allows to control a Yamcs Server. It shows the list of data links, channels and clients connected to the Yamcs Server.  Only one Yamcs instance is shown at a time, and the currently selected instance can be changed using the Instance menu.

* TOC
{:toc}

## Installing
	
### Dependencies
<table class="inline">
    <tr>
        <th>OS</th>
        <td>Linux or Windows, 32bit or 64bit</td>
    </tr>
    <tr>
        <th width="1">Java runtime (JRE)</th>
        <td>Version &gt;= 1.8</td>
    </tr>
</table>
	
### Installation
The Yamcs Monitor is delivered as part of an archived client tools package. The package does not need to be installed, just extracted to a suitable location. The tools can be run from the extracted location using starting scripts found in the <tt>bin</tt> folder.

### Configuration
No further configuration is needed, unless the Yamcs server has been configured to require authentication. In this case, edit the <tt>etc/yamcs-ui.yaml</tt> file in the extracted location and change <tt>authenticationEnabled</tt> entry to <tt>true</tt>.

### Updating
Updated applications are made available as an archived client tools package. This should be extracted into its own folder, separate to any previous installation. The configuration files in <tt>etc/</tt> can be copied from a previous installation into the new installation.

### Removing
To remove an installation, delete the extracted folder.


## Starting Yamcs Monitor
On Windows and OS X, start Yamcs Monitor with the command
 
    $ yamcs-monitor.sh

On Windows use the bat-script instead:

    $ yamcs-monitor.bat
    
After startup, select **File > Connect to Yamcs** to connect to a Yamcs Server instance:

![Yamcs Connection Dialog](/assets/tools/connect-to-yamcs.png){: .center-image }

A URL can be provided on the command line to connect directly after the startup, without needing to connect from the menu:
	        
    $ yamcs-monitor.sh yamcs://localhost:5445/

The command line option <tt>-na</tt> causes Yamcs Monitor to run in so-called no-admin mode. In this mode a series of options and buttons are hidden from the GUI in order to not confuse the unaware user. These options are useful only for a user having admin privileges. For the remaining documentation, it is assumed that Yamcs Monitor has the admin options enabled.


## User interface

![Yamcs Monitor](/assets/tools/yamcs-monitor.png){: .center-image }

The Yamcs Monitor window is divided in four parts:

* The left upper part shows the data links;
* The left lower part shows the channels;
* The right part shows client information;
* The right bottom part shows an input panel to create new replay channels.

    
### Data Links
This box displays a list of data links. Each element in the list contains these items:

<table class="inline">
    <tr>
        <th>Name</th>
        <td>has to be unique and can be specified in the <tt>etc/yamcs.instance.yaml</tt> configuration file. If not specified, it is chosen automatically by the Yamcs Server</td>
    </tr>
    <tr>
        <th>Type</th>
        <td>represents the Java class name of the implementor of the data link</td>
    </tr>
    <tr>
        <th>Spec</th>
        <td>represents the configuration of the data link. It can contain different information depending on the data link type</td>
    </tr>
    <tr>
        <th>Stream</th>
        <td>represents the stream name used by the data link to write (in case of TM and PP) or read (in case of TC) data</td>
    </tr>
    <tr>
        <th>Status</th>
        <td>can be one of OK, ERROR or DISABLED</td>
    </tr>
    <tr>
        <th>Data Count</th>
        <td>contains the list of items (e.g. TM packets) that have transited through the link</td>
    </tr>
</table>

In addition, each line is color-coded as follows:

<table class="inline">
    <tr>
        <th>White</th>
        <td>the link is connected</td>
    </tr>
    <tr>
        <th>Green</th>
        <td>the link is connected and data has been flowing in the last two seconds</td>
    </tr>
    <tr>
        <th>Gray</th>
        <td>the link is disabled</td>
    </tr>
    <tr>
        <th>Red</th>
        <td>the link is enabled but not connected</td>
    </tr>
</table>

The data links provide a more detailed status when hovering the mouse on top of them. Note that the OK/ERROR status depends on the specific implementation of the Data link. For example the DaSS TM and PP provider will report the status as OK even though some of the requests have failed (we should perhaps introduce a *WARNING=yellow* status for this). The detailed report shows exactly which requests have succeeded and which ones have failed. 


### Channels
This box displays a list of channels currently available. The Name column indicates a unique channel name. It should describe the channel data briefly. The Creator column shows the user who created the channel.

At server startup there is one realtime channel automatically created.
    
#### Channel Information
This box displays current information about PathTM (**TM Status**), Processed Parameters (**PP Status**), and telecommands. Each of these parts can be temporarily disabled using the Disable buttons. To enable a part again, the Disable button is pressed again.

The table shows one row per packet type received via PathTM. Over time, this table may accumulate payload HK packets, TC response packets, science packets, and SSL event packets. All packets defined in the MDB can be listed here, if they appear in the PathTM stream.

#### Connected Clients
This box shows all connected processor clients. The ChannelName column tells the name of the processor the client is currently connected to.

By right-clicking on a client, a popup menu appears, and the client can be connected to any of the channels. This way, even several clients may be connected to a single processor. Processors without clients are instantly removed.

New clients are automatically connected to the <tt>realtime</tt> processor. This processor will never be removed, even if there are no clients connected.

#### New Channel
In this box, replay channels are created. The Name field contains the name of the new channel. The start time, stop time, and the packets to be received are shown. To populate these fields, the Archive Browser window is used. To open it, click **Open Archive Selector**.

Packets can be removed from the given list by selecting them and pressing the Del key.

Realtime speed indicates that data is replayed at the same speed it was recorded. Fixed speed will play the data at one packet per second, no matter how fast they were recorded.

When the **Loop Replay** is ticked, the replay will wrap around and automatically restart from the beginning. Otherwise, the replay stops when it ends at the stop time.

To create the channel, click **Create**. One or more clients must be selected which will then be assigned to the new channel.


### Command Queue Control
The Command Queue Control window can be opened either from the main Yamcs Monitor window by double-clicking on a channel name. The Command Queue Control only makes sense for processors which have commanding enabled.

![Command Queue Control](/assets/tools/command-queues.png){: .center-image }

The window is split into two panels:

* The upper panel contains a list with all the defined command queues. The queue name, the current state and the number of commands that are currently in the queue is displayed. Right-clicking on a command queue opens a menu with the possibility to change the state of the queue. 

    In addition to setting the new state of the queue, the following additional actions happen when changing the state of a blocked queue:
    
    * blocked &#8594; disabled: all the commands in the queue will be automatically rejected;
    * blocked &#8594; enabled: all the commands in the queue will be automatically sent.
    <br>

* The bottom panel contains the list of commands currently present in the queue selected in the upper panel. For each command the queue name, the command id, the user that has sent the command and the command string are display. The list is empty if the selected queue is not in the state blocked.

    Right-clicking on a command gives the possibility to **Send** or **Reject** the command.

