---
layout: default
sidebar: yes
permalink: /docs/studio/Archive/
---

The Archive view represents a visual view of the data stored in the Yamcs archive. Through this view we can also initialize and control replays of archived telemetry.

* TOC
{:toc}

### User Interface
We are aware that the current user interface takes some getting used to. The Archive view always works on a range of indexed data, which it fetches from the server. All further actions like zooming happen client-side on the loaded data range.

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

You can ![Zoom In](/assets/studio/icons/zoom_in.png){: .inline-image} **Zoom In** or ![Zoom Out](/assets/studio/icons/zoom_out.png){: .inline-image} **Zoom Out**. If you are interested in a specific range, than select a time range by clicking and dragging your mouse before you click **Zoom In**.

Notice as you are zooming that a horizontal scroll bar appears. This allows you to scroll left and right within the initially load time range.

To clear your zoom stack, select ![Clear Zoom](/assets/studio/icons/zoom_clear.png){: .inline-image}  

### Replaying data

