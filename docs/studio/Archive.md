---
layout: default
sidebar: yes
permalink: /docs/studio/Archive/
---

The Archive view represents a visual view of the data stored in the Yamcs archive. Through this view we can also initialize and control replays of archived telemetry.

* TOC
{:toc}

### User Interface
The Archive view always works on a range of indexed data, which it fetches from the server. All further actions like zooming happen client-side on the loaded data range.

#### Choosing a Data Range
As a first step you should select your data range. Click the pull-down icon ![Pull-down Menu](/assets/studio/view-pulldown.png){: .inline-image} to bring up this menu:

![Choose Data Range](/assets/studio/archive-range.png)

You can choose one of the predefined half-open time intervals, or you can select **Custom...** to specify your preferred range. Ranges can be half-open, which means they will always grow to include more bordering data as it becomes available.

If you choose for example **Last Day**, Yamcs Studio will fetch an index of the archive for that time period, and refresh your view.

Your chosen data range is stored in your user preferences and will be restored the next time you open Yamcs Studio.

#### Selecting Data
If this is the first time you have opened Yamcs Studio on your workstation, you will still not be able to see anything, other than some empty zones named:

* Completeness Index APID
* TM Histogram
* PP Histogram
* CMDHIST Histogram

![Archive with Hidden Data](/assets/studio/archive-empty.png){: .center-image }

You need to choose which index data you actually want to display in your view. If there is data available for a zone, you can right-click it to bring up a pop-up menu where you select **Add Packets > ... > All Packets**. Your view will then update to show the selected packets.

<div class="hint">
    We say <em>packets</em> since this is typically what we're interested in when browsing the Archive, but really it covers any kind of data that can be displayed through the Archive view.
</div>

![Archive](/assets/studio/archive.png){: .center-image }

Note that the view does not refresh itself, so hit ![Refresh](/assets/studio/icons/refresh.png){: .inline-image} **Refresh** whenever you want to load the latest data for your selected time range.

#### Navigating
The vertical red locator shows the current time as provided by Yamcs. When we hover the mouse over the view, a grayed-out locator indicates the current mouse position.

You can **Zoom In** ![Zoom In](/assets/studio/icons/zoom_in.png){: .inline-image} or **Zoom Out** ![Zoom Out](/assets/studio/icons/zoom_out.png){: .inline-image}. If you are interested in a specific range, than select a time range by clicking and dragging your mouse before you zoom in.

Notice as you are zooming that a horizontal scroll bar appears. This allows you to scroll left and right within the initially load time range.

To clear your zoom stack, select **Clear Zoom** ![Clear Zoom](/assets/studio/icons/zoom_clear.png){: .inline-image }.  

### Replaying data
We can use this view to replay archived data. Click **Replay** ![Replay](/assets/studio/icons/replay.png){: .inline-image }.

![Replay Dialog](/assets/studio/replay-dialog.png){: .center-image }

In the dialog, confirm or filter the suggested selection of data. Currently only telemetry packets and processed parameters that were made visible in the Archive are part of the selectable data. 

Modify **Start At** to where you want to start the replay from.

Yamcs will create a processor (next to the built-in *realtime* processor) with the name that you provide in the **Name** field. The exact name that you choose is of no importance (although it needs to be unique), it helps you to identify the processor.

Click OK to start the replay. Yamcs Studio will reset any operator displays you may have opened, and will automatically switch to the newly create replay processor, as visible in the processor indicator in the top-left of your window.

![Replay Processor](/assets/studio/replay-processor.png)

Notice also that the Archive view is now equipped with an additional control bar.

![Replaying](/assets/studio/replaying.png){: .center-image }

The red locator shows you the current time of the replay processing. Double click anywhere to the left or to the right to make the processing jump to another point in time.

Click **Pause** ![Pause](/assets/studio/icons/pause.png){: .inline-image } to pause the processing, and use **Forward** ![Forward](/assets/studio/icons/forward.png){: .inline-image } to increase the speed of the processing. This button currently cycles through 5 predefined speed steps.

<table class="inline">
    <tr>
        <td width="80"><img src="/assets/studio/icons/forward.png"></td>
        <td>Original Speed</td>
    </tr>
    <tr>
        <td><img src="/assets/studio/icons/forward2x.png"></td>
        <td>2x Original Speed</td>
    </tr>
    <tr>
        <td><img src="/assets/studio/icons/forward4x.png"></td>
        <td>4x Original Speed</td>
    </tr>
    <tr>
        <td><img src="/assets/studio/icons/forward8x.png"></td>
        <td>8x Original Speed</td>
    </tr>
    <tr>
        <td><img src="/assets/studio/icons/forward16x.png"></td>
        <td>16x Original Speed</td>
    </tr>
</table>

Speeding up will not cause any reset of your displays, as the same data is arriving, just faster.

When you want to leave the replay, there are several ways to do so:

* Hit **Return to Realtime** ![Return to Realtime](/assets/studio/icons/redo.png){: .inline-image };
* Open the pull-down menu &#x25BC; next to the **Replay** ![Replay](/assets/studio/icons/replay.png){: .inline-image } button to choose a different processor;
* Click on the processor info bar in the top left of the window, to choose a different processor.
