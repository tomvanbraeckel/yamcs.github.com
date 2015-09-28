---
layout: default
permalink: /running/
sidebar: no
title: Up & Running
---

Yamcs deployment details can vary greatly from mission to mission. To present an overall feel of the core system, we have created a sample configuration, which we call the **Yamcs Simulation System (YSS)**.

* TOC 
{:toc}

## Yamcs Simulation System (YSS)

The YSS configuration is simple by design, showcasing only core functionality. In the backend, it includes just two servers: **Yamcs** and a generic **Simulator**. These servers are set-up to exchange TM and TC. In the frontend, we connect sample operator displays that were authored in **Yamcs Studio**, as well as a selection of built-in displays (Archive, Command Stack, etc.). From Yamcs Studio we can send commands to Yamcs, which in turn will verify and issue them to the Simulator.

Running YSS is easy and straight-forward, but there are a few requirements you'll need to make sure your system has before you start. In particular this showcase uses `docker` and `docker-compose` to run container images that are prebuilt by the core Yamcs development team, and updated together with every Yamcs release.

## Install Docker

Detailed installation instructions can be found at [https://docs.docker.com/installation/](https://docs.docker.com/installation/). For example, on Ubuntu 14.04 LTS the simplest install would be something like:

    $ curl -sSL https://get.docker.com/ | sh
    
Docker's official documentation also explains how to set up `docker` so that you don't need to prepend every command with `sudo`, which we definitely recommend. Further instructions presume that `docker` was configured as such, and will no longer mention the use of `sudo`.

Verify correct installation by running `docker -v`. 

## Install Docker Compose

Detailed installation instructions can be found at [https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/). It boils down to this:

1. Get the `docker-compose` binary.

        $ sudo wget https://github.com/docker/compose/releases/download/1.4.0/docker-compose-`uname  -s`-`uname -m` -O /usr/local/bin/docker-compose

    This command installs the binary in the `/usr/local/bin` directory. 
	
2. Add executable permissions to the binary.

        $ sudo chmod +x /usr/local/bin/docker-compose
        
Verify correct installation by running `docker-compose -v`. Any problems related to this latest command usually have to do with either not having started the docker daemon (for some platforms this is automatically configured, for others not), or by not having added your user to the `docker` group. Please ask a yamcs developer for further assistance specific to your platform if you get stuck on this.
		
## Run Yamcs and the Simulator

With all the preparations done, we now get to run a Yamcs instance in a box (well, container).

1. Get the YSS configuration. You have the choice between two different configurations:

    * A 5Hz Launch &amp; Landing simulator
    
            $ curl -sSL http://www.yamcs.org/yss/landing.sh | sh
            $ cd landing
    
    * A 1Hz LEO Spacecraft simulator

            $ curl -sSL http://www.yamcs.org/yss/leo_spacecraft.sh | sh
            $ cd leo_spacecraft

    This will create a directory `landing` or `leo_spacecraft` under your current working directory with some configuration files needed to link the Yamcs container with the Simulator container.

2. Start your YSS deployment with compose.
    
        $ docker-compose up       
    
    This will download, then launch both Yamcs and the Simulator in the foreground. You should see some log messages and the phrase  *yamcsstartup success* near the bottom.
    
    When you're done with testing and want to shutdown the deployment, just `CTRL-c` this process. Later on, whenever you want the YSS configuration back up again, go to the applicable directory and run `docker-compose up`.
    
**Note:** If you are upgrading from a previous version, remove your current configuration, and re-execute Step&nbsp;1. Replace Step&nbsp;2 with:

    $ docker-compose build
    $ docker-compose up --force-recreate


## Run Yamcs Studio

We now have a working Yamcs Server receiving and recording telemetry from a Simulator. To get a better peek at what's happening we will now launch Yamcs Studio -- a rich desktop client for Yamcs. Make sure you have Yamcs Studio installed (refer to [these instructions](/docs/studio/installation)). From the menu choose `File > Connect...` and fill in these details:

![YSS Connection](/assets/yss-connect.png){: .center-image }

Soon after clicking the `Connect` button, you should notice the processor in the top bar updating to `realtime`.

Now, open a sample display by clicking on `Bookmarks` in the top bar. Note that none of these YSS displays are perfect. There are non-sensical things in them. Most widgets are backed by TM from the simulator, but some widgets are unconnected, others use locally simulated values using in-display functions. 

The displays you should open depends on the YSS configuration that you are currently running with (otherwise the display widgets would not be able to connect).

* If you started the Landing configuration, then choose `YSS Landing: Flight Data`. When you run this display for a while it might look like this (the simulator will loop forever).

    ![YSS Flight Data](/assets/yss-flight-data.png){: .center-image }
    
* If you started the LEO Spacecraft configuration, then choose `YSS LEO Spacecraft: Main`. In its current state, the display is a bit bare-bones. But it does enable us to have a peek at what is being generated by the simulator. And we can use this blank slate to test out the display authoring in Yamcs Studio.

    ![YSS Flight Data](/assets/yss-leo-spacecraft.png){: .center-image }

## Quick Tour of Yamcs Studio
Yamcs Studio has two different modes (called *perspectives*). OPI Editor and OPI Runtime. When Yamcs Studio is launched for the first time the user will be welcomed with the default OPI Runtime perspective. 

### OPI Runtime

This perspective is useful for realtime operations, or for testing out displays as they are being built. The default layout looks like this:

![YSS Flight Data](/assets/yss-flight-data-annotated.png){: .center-image }

1. Processor Info
    This zone holds two status indicators. The first indicator light shows the processor that Yamcs Studio is currently listening to. Yamcs supports many concurrent processors (realtime, replay channels). By default Yamcs Studio will always connect to `realtime`.
    
    Next to that we see a second indicator which currently shows the processor time as provided by Yamcs. The simulator outputs generation times equal to the local system clock. If however we were to start a replay of archived data, we would notice this time adjusting to the location of our replay channel.

2. Perspective Switcher
    When you launch Yamcs Studio it will open in `OPI Runtime` mode (OPI means Operator Interface). With the perspective switcher you can switch Yamcs Studio to the `OPI Editor` mode. Doing so will store and close your current arrangement of windows and views, and will open a different arrangement that is optimised for editing displays.
    
    Note that it is possible to make builds of Yamcs Studio that include *only* the runtime perspective. This can significantly improve UX during operations.

3. Display Tabs
    Displays open in different tabs. These are not normal tabs, though. By clicking and dragging these tabs we can easily create split screens, or different tab stacks. We can also drag a tab out of its parent window into a new window. In fact, Yamcs Studio is optimised for multi-monitor systems. Window layouts are restored even through restarts of Yamcs Studio.

4. Display Zoom
    The above display was configured in such a way that it automatically stretches (while preserving aspect ratio) to fit the available screen space. This behaviour can be turned on or off by the display author. Regardless of its setting, as a display user we can always zoom in or out of the display using these controls.

5. Operator Displays
    This area contains displays that were authored in the OPI Editor perspective. Displays contain any number of widgets. Most widgets can be connected to TM, which will also make them alarm-sensitive. In practice this means that they will be highlighted with different decorations depending on the alarm level. There are also things like button widgets which can for example open other displays, or launch a telecommand, or open dialog boxes, etc. All widgets are highly customisable using scripts and/or rules (rules are a user-friendly layer on top of scripts). We are in the process of documenting and expanding the library of functions that can be called from scripts.
   
6. Built-In Displays
    Yamcs Studio comes with an array of built-in displays that offer more dynamic views on different aspects of Yamcs. These built-in displays (or *Views*, as we call them inside Yamcs Studio) include such things as commanding, event logging, alarm overviews (upcoming) and archive insight.

### TC Commanding
Yamcs Studio ships with a few built-in displays for commanding payloads.

* Command Stack
    The Command Stack allows operators to prepare stacks of commands for manual command issuing. The process is intentionally click-heavy to make sure that operators are aware of what they are doing.

* Command History
    The Command History keeps track of all commands that were issued using Yamcs (not just by yourself, but by anyone). By default it follows realtime commands, but it is also possible to load an archived range of data from the server.

* Command Queues
    This view allows controlling the Yamcs queues from the point of view of Yamcs Server. With sufficient privileges, queues can be blocked or disabled.
    
While these views work fine, we are not done bulking them up with features, and also offer different solutions for automated procedures.


### OPI Editor
Finally, let us now have a quick look at the OPI Editor. In the top right, change your copy of Yamcs Studio to `OPI Editor` mode (in case you don't see it, choose it from the dialog that pops up when clicking the plus-icon). 

![OPI Editor Perspective](/assets/yss-opi-editor-perspective.png){: .center-image }

Your window arrangement changes to something like this.

![OPI Editor](/assets/opi-editor.png){: .center-image }

In the left navigator, expand the YSS project and open for example our `FlightData.opi` by right-clicking and choosing `Open With > OPI Editor`.

**Note:** we are aware that right-clicking it is slightly annoying. The left-click action by default opens the OPI file with OPI Runtime. Once you've successfully opened an OPI with the OPI Editor the left-click action will from that point always open it with the OPI Editor, as it remembers its last handler. We definitely want to improve the user experience here. But for now, please bear with us as we do the needed development work.

The window layout can be decomposed like this:

![Edit FlightData.opi](/assets/yss-opi-editor-flight-data-annotated.png){: .center-image }

1. Navigator
    The navigator contains all projects within the current workspace. In general a project is at the same level as a mission, but this is not strictly necessary. When we launch Yamcs Studio with a new workspace, it will always automatically create the `YSS` project. Once you have added your own project, you can remove `YSS` and it won't be autocreated anymore.
    
    A project contains Operator Displays (`*.opi`), images, color profiles (`*.def`), custom scripts (`*.js` or `*.py`), etc. Familiarise yourself with the right-click option as you go about opening displays. Displays can be opened in a few different modes within the OPI Editor.
    
    * In editing mode
    * In runtime mode in a Standalone window
    * In runtime mode within the workbench itself (this will split your window to make room for it)
    * In a new window using the green launch button in the toolbar
    
       
        It is useful to have all these options when you're in the process of editing and testing displays with realtime telemetry, but do pay attention to treat the OPI Editor like an editor, not like a runtime viewer. During operations you should switch back to the OPI Runtime.

2. Editor Area
    This area contains tabs for every OPI that was opened for editing. This offers familiar editing controls. Widgets can be selected, grouped, dragged and deleted to your personal taste.

3. Outline
    The Outline view gives a hierarchical breakdown of all the widgets within the currently active editor tab. It is useful for finding back widgets. Widgets that were named will be easily identifiable. 

4. Toolbar
    The toolbar offers context-sensitive controls. This includes general *Save* functionality, as well as handy features like grid toggling or space distribution among different widgets.

5. Properties
    This view shows the properties of widgets (or of the display itself). Notable properties include the `PV Name` which allows you to connect a widget with a specific Yamcs parameter (with autocompletion support). Other properties allow the display author to greatly tweak default widget behaviour. And in cases where the properties are not sufficient, we can always escape to more customization options using scripts and rules (there are properties for adding these as well). 

6. Palette
    The palette contains the widgets that are available in your copy of Yamcs Studio. Select a widget from the Palette, and then click somewhere in the editor area to place it down. 

When you're done doing changes, make sure to save them (`File > Save All`). You can now test out your changes by clicking the launch button ![Test Runtime](/assets/opi-editor-launch.png) from the toolbar.

This will open a new runtime window (notice it uses the OPI Runtime perspective). If you leave this window open, and you save more changes, do a right-click in your display tab and choose `Refresh OPI`. You will do this a lot as you go about editing displays. You can also refresh by hitting `F5`, but make sure that your display actually has focus (for example by clicking somewhere in the editor before hitting `F5`.

For more on Yamcs Studio, see [Yamcs Studio User Guide](/docs/studio/).
