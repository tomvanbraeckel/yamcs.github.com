---
layout: default
sidebar: yes
permalink: /docs/studio/Display_Builder/
---

The Display Builder window is used to create or edit displays.

![Display Builder](/assets/opi-editor.png){: .center-image }

In the left explorer, expand the YSS Landing project and open for example <tt>FlightData.opi</tt> by double-clicking the file.

The window layout can be decomposed like this:

![Edit FlightData.opi](/assets/yss-opi-editor-flight-data-annotated.png){: .center-image }

1. Explorer
    The [Explorer](/docs/studio/Explorer/) contains all projects within the current workspace. In general a project is at the same level as a mission, but this is not strictly necessary. When we launch Yamcs Studio with a new workspace, it will always automatically create the YSS project. Once you have added your own project, you can remove YSS Landing and it will not be auto created anymore.
    
    A project contains Operator Displays (<tt>*.opi</tt>), images, style definitions (<tt>*.def</tt>), custom scripts (<tt>*.js</tt>), etc. By right-clicking an OPI file, displays can be opened in two different modes.
    
    * In editing mode (default)
    * In runtime mode (via a new view)

2. Editor Area
    The [Editor Area](/docs/studio/Editor_Area/) contains tabs for every OPI that was opened for editing. This offers familiar editing controls. Widgets can be selected, grouped, dragged and deleted to your personal taste.

3. Outline
    The [Outline](/docs/studio/Outline/) view presents a hierarchical breakdown of all the widgets within the currently active editor tab. It is useful for finding back widgets. Widgets that were named will be easily identifiable. 

4. Toolbar
    The toolbar offers context-sensitive controls. This includes general *Save* functionality, as well as handy features like grid toggling or space distribution among different widgets.

5. Properties
    The [Properties](/docs/studio/Properties/) view shows the properties of widgets (or of the display itself). Notable properties include the **PV Name** which allows you to connect a widget with a specific Yamcs parameter (with autocompletion support). Other properties allow the display author to greatly tweak default widget behaviour. And in cases where the properties are not sufficient, we can always escape to more customization options using rules and scripts (there are properties for adding these as well). 

6. Palette
    The [Palette](/docs/studio/Palette/) contains the widgets that are available in your copy of Yamcs Studio. Select a widget from the Palette, and then click somewhere in the editor area to place it down.

When you are done doing changes, make sure to save them (**File > Save All**). You can now test out your changes by clicking the launch button ![Test Runtime](/assets/opi-editor-launch.png) from the toolbar.

This will open a new runtime window (notice it uses the OPI Runtime perspective). If you leave this window open, and you save more changes, do a right-click in your display tab and choose **Refresh OPI**. You will do this a lot as you go about editing displays. You can also refresh by hitting **F5**, but make sure that your display actually has focus (for example by clicking somewhere in the editor before hitting **F5**).
