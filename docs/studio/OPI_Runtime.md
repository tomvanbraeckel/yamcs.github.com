---
layout: default
sidebar: yes
permalink: /docs/studio/OPI_Runtime/
---

The OPI Runtime perspective is useful for realtime operations, or for testing out displays as they are being built. The default layout looks like this:

![YSS Flight Data](/assets/yss-flight-data-annotated.png){: .center-image }

1. Processor Info
    This zone holds two status indicators. The first indicator light shows the processor that Yamcs Studio is currently listening to. Yamcs supports many concurrent processors (realtime, replay channels). By default Yamcs Studio will always connect to <tt>realtime</tt>.
    
    Next to that we see a second indicator which currently shows the processor time as provided by Yamcs. The simulator outputs generation times equal to the local system clock. If however we were to start a replay of archived data, we would notice this time adjusting to the location of our replay channel.

2. Perspective Switcher
    When you launch Yamcs Studio it will open in <tt>OPI Runtime</tt> mode (OPI means Operator Interface). With the perspective switcher you can switch Yamcs Studio to the <tt>OPI Editor</tt> mode. Doing so will store and close your current arrangement of windows and views, and will open a different arrangement that is optimised for editing displays.
    
    Note that it is possible to make builds of Yamcs Studio that include *only* the runtime perspective. This can significantly improve user experience during operations.

3. Display Tabs
    Displays open in different tabs. These are not normal tabs, though. By clicking and dragging these tabs we can easily create split screens, or different tab stacks. We can also drag a tab out of its parent window into a new window. In fact, Yamcs Studio is optimised for multi-monitor systems. Window layouts are restored through restarts of Yamcs Studio.

4. Display Zoom
    The above display was configured in such a way that it automatically stretches (while preserving aspect ratio) to fit the available screen space. This behaviour can be turned on or off by the display author. Regardless of its setting, as a display user we can always zoom in or out of the display using these controls.

5. Operator Displays
    This area contains displays that were authored in the OPI Editor perspective. Displays contain any number of widgets. Most widgets can be connected to TM, which will also make them alarm-sensitive. In practice this means that they will be highlighted with different decorations depending on the alarm level. There are also things like button widgets which can for example open other displays, or launch a telecommand, or open dialog boxes, etc. All widgets are highly customisable using scripts and/or rules (rules are a user-friendly layer on top of scripts). We are in the process of documenting and expanding the library of functions that can be called from scripts.
   
6. Built-In Displays
    Yamcs Studio comes with an array of built-in displays that offer more dynamic views on different aspects of Yamcs. These built-in displays (or [Views](/docs/studio/Views/), as Yamcs Studio calls them) cover concepts like commanding, event logging, alarm overviews (upcoming) and archive insight.
