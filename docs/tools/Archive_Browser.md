---
layout: default
sidebar: yes
permalink: /docs/tools/Archive_Browser/
---

Archive Browser is an application that allows inspecting the content of the TM and PP archive, as well as retrieving data as packets or parameters. It can be run either as a standalone application (`archive-browser.sh`) or from the Yamcs Monitor.
    
![Archive Browser](/assets/tools/archive-browser.png){: .center-image }

### Getting Started
The main part of the window comprises a display to visualize the content of the archive. When opening the window for the first time, it needs to be populated. This is done by entering the start and end range and clicking **Reload View**. The buttons next to the **Reload Range** input fields can be pressed to popup a calendar that can be used to select the date. The time of the day has to be entered manually. In addition, the **Select last...** dropdown can be used to fill in the range start with current_time (3, 6 or 12 months). Leaving any of the fields empty, means minus or plus infinity. To refresh data with the newest realtime data, the end of the range can be left empty.
            
Clicking the **Reload View** button, will request information from Yamcs Server about all data available in the selected range, so this operation may take some time, depending on the amount of data, and depending on the bandwidth of the network connection. During the reload process, the *Packets* row in the *Archive Information* box displays the progress.

The data panel contains three sub-panels for displaying three data types:

* **Tags**. These are simply names that can be used by the operator to mark special activities. Together with a name, a tag has associated a color, a description and a start/end time. New tags can be created by selecting a data range and pressing the **New Tag** Button.

* **Completeness Data**. These are records created by a completeness checker running on the server. The way to check the completeness and the granularity, depends on the input data. For CCSDS packets, it can be checked at APID level based on the CCSDS Sequence Count.

* **Histogram Data**. These are records showing statistical information about the packets (or data items in general). Unlike the Completeness Data, heuristics are used to determine the start/end of a record. These are not useful to determine the data completeness but rather to have a overview of what data is available in the archive.

By default no data is shown. It is now up to the user to choose and display packets. This is done by right-clicking in the empty space left to the vertical divider. A popup menu offers to add packets. One packet can be added at a time, or with one mouse click all packets of a single payload can be added. Each packet is shown in a random colour to distinguish it visually from its neighbour packets. The colour can be changed by right-clicking on the packet label and choosing the appropriate menu item.

Payload names are detected from packet opsnames. It is expected that good telemetry packet opsnames start with their payload's name, separated from the remainder by an underscore.

When all desired packets are selected, the timeline display can be used to inspect the data. A solid rectangle represents a block of PathTM data received at a constant rate. The mouse can be moved over the rectangle to show a tooltip which describes the exact time range and the packet frequency.

To mark a selection, the left mouse button is pressed and held, and the mouse is moved to mark start and stop times.

When the **Zoom in** button is pressed, the current selection will be zoomed in to fit the view. The total scrollable range will then be limited to a reasonable time frame. This means that distant times may be out of reach using the horizontal scroll. This is because the selection may be so small that the total scrollable view would grow too large to handle.

While zooming into selections, previous zoom levels will be remembered. The **Zoom Out** button restores the previous zoom level. Depending on the zoom depth, the time scale will adjust in order to be as appropriate as possible to fit the current zoom resolution. The **Show All** button will discard all zoom levels, showing the total range of telemetry in the archive.

All dates shown in Archive Selector can be shown in a format using month and day (YYYY.MM.DD) or the day of the year (YYYY/DDD). This can be toggled in the **View** menu.

### Selecting Data
 When the **Apply Selection** button is pressed, the current selection is subject for replay. This includes all telemetry packets shown. Those packets visible but unwanted can be removed using the popup menu on the respective packet labels.

By pressing the **Apply Selection** button, the start time, stop time, and packet names are inserted into the Yamcs Monitor **New Channel** box. There, unwanted packets can still be removed using the Del key. Further details like playback speed and loop mode can be specified there.

The Archive Selector window remains open to allow the replay to be followed. It can be closed anytime if desired.

### Replaying Data
 When the selection has been applied, the new channel is ready to be created in Yamcs Monitor. Pressing the **Create** button will create the channel, connect it to the selected clients, and start replay immediately.

Once the replay has started, a start marker and a stop marker appear on the Archive Selector display. These are tagged with yellow rectangles. A third marker denotes the current position. It is tagged with two green triangles. The current position marker and the **Replay Control** panel are updated often.

While the replay is progressing, selections can still be made in order to zoom in and to refine the display.

The archive replays are seekable with random access at any time. The right mouse button can be used to move the current position marker to any new position. The new position may be before or after the current position. If it is before the start marker, the replay will automatically jump exactly to the start marker. If the new position is after the stop marker, the replay will end and optionally restart if loop was enabled.

The Archive Selector will show replay progress of the current channel selected in Yamcs Monitor. To switch to another replay channel, the desired channel only needs to be selected. The Archive Selector Window is updated with the information taken from the newly selected channel.

### Parameter Retrieval
The Parameter Retrieval tool can be started from the Archive Browser by pressing the **Parameter Retrieval** button once a time range has been selected in the histogram panel. Only the time range is used, the packet selection is automatically performed by the Yamcs server depending on the parameters requested.  
   
![Parameter Retrieval](/assets/tools/parameter-retrieval.png){: .center-image }
    
The operation of the Parameter Retrieval tool is very simple: a number of parameter names have to be added to the left panel, and the **Start Retrieval** button pressed.

There are a number of methods for selecting parameters to be replayed:

* by entering the names in the text area;
* by opening a file containing a list of parameters one per line or a USS file;
* by selecting a recently opened file using the **Recent** button;
* by selecting parameters from a hierarchical display of the packets and parameters in the MDB using the **Select** button.

The following options can be selected to change how the output file is constructed and its contents:

<table class="inline">
    <tr>
        <th>Print the generation time</th>
        <td>Causes a column containing the time to be added before the parameters columns. Selected by default.</td>
    </tr>
    <tr>
        <th>Print the raw value</th>
        <td>Causes the raw values to be printed in addition to the engineering values. Note that some processed parameters may not have raw values.</td>
    </tr>
    <tr>
        <th>Print only the unique lines</th>
        <td>Skip outputting the lines where all the parameters have the same values like the previous line. It is especially useful for printing enumerated parameters (i.e. parameter of type ON/OFF) such that only the changes are printed.</td>
    </tr>
    <tr>
        <th>Print only the full lines</th>
        <td>Discard lines that do not have all the columns filled in. For example if some headers parameters are selected in addition to parameters from a specific packet, this option will avoid printing the headers for all the packets.</td>
    </tr>
    <tr>
        <th>Keep previous values</th>
        <td>Avoids having empty cells in case data from multiple packets is selected.</td>
    </tr>
    <tr>
        <th>Merging time window of X ms</th>
        <td>Causes data coming in intervals smaller than X ms to be merged together.</td>
    </tr>
    <tr>
        <th>Ignore invalid parameters</th>
        <td>Do not raise an error if the list contains some invalid parameters.</td>
    </tr>
    <tr>
        <th>Output in PET format</th>
        <td>Produce output compatible with the PET tool, specifically the values are enclosed by quotes and separated by semicolon and there are some extra headers listing the parameter names and types.</td>
    </tr>
</table>
