---
layout: default
sidebar: yes
version: 1.0.0-beta.24
permalink: /docs/studio/1.0.0-beta.24/Properties/
---

The Properties view is used in the OPI Editor perspective to edit properties of your display, or to edit properties of a widget.

Select a widget to see its properties in the Properties view. The contents of this view adapts to your selection. Click in the **Value** column to edit a specific property, depending on the type of property this will trigger different behaviour. For example, if the property is just a numeric value, you can edit it in-place (confirm with **Enter**). If the property represents multiline text or a list of items you will typically have more advanced editing controls in a popup dialog.

![Properties](/assets/studio/properties.png){: .center-image }

<div class="hint">
    Changes are not saved automatically. Remember to select <strong>File > Save All</strong> before you refresh a runtime OPI. 
</div>

Depending on the types of involved widgets, it may be possible to batch-edit some properties by selecting multiple different widgets.

### Widget Properties

Different widgets have different properties, but many of those properties are shared among them. These include:

<table class="inline">
    <tr>
        <th class="code">Name</th>
        <td>A name that identifies this widget in the Outline view. There is no constraint on uniqueness, but when not specified by the user, Yamcs Studio will try to determine a unique name by concatenating the widget type with a sequential number.</td>
    </tr>
    <tr>
        <th class="code">X<br>Y<br>Width<br>Height</th>
        <td>
            <p>Widgets are contained in a bounding box which is controlled by these properties.</p>
            <p><tt>X</tt> and <tt>Y</tt> indicate the pixel position of the widget within the display. The origin is located at the top left of the Editor Area. The X and Y position of the widget also indicates the top left of its bounding box.</p>
            <p><tt>Width</tt> and <tt>Height</tt> indicate the size of the bounding box. Many widgets support automatic scaling within the available bounding box.</p>
        </td>
    </tr>
    <tr>
        <th class="code">PV Name</th>
        <td>
            <p>The unique name of a <a href="/docs/studio/Processed_Variables/">PV</a> that will be backing this widget. At runtime the value of this PV will be used to control the intrinsic value of the widget, or to decorate it in case of off-nominal state.</p>
            <p>If the PV concerns a Yamcs parameter, and Yamcs Studio is connected to Yamcs, you will get autocompletion support on parameter names based on the contents of the Mission Database.</p>
        </td>
    </tr>
    <tr>
        <th class="code">Alarm Sensitive</th>
        <td>Toggles whether or not the bounding box of this widget will be decorated during runtime based on off-nominal values of its connected PV.</td>
    </tr>
    <tr>
        <th class="code">Border Color<br>Border Style<br>Border Width</th>
        <td>Allows drawing the contours of the widget's bounding box using a wide variety of different styles.</td>
    </tr>
</table>

### OPI Properties
The OPI itself is also a special kind of container widget with editable properties. Click on an empty region of your Editor Area to see these.

Specific properties include:

<table class="inline">
    <tr>
        <th class="code">Show Ruler<br>Show Grid<br>Grid Color<br>Grid Space</th>
        <td>Configure the ruler or the grid. Notice that these properties are tied to a specific OPI. The visibility can also be toggled using the toolbar. If the grid is toggled on, the grid lines will work as magnets when positioning widgets.</td>
    </tr>
    <tr>
        <th class="code">Snap to Geometry</th>
        <td>When enabled, Yamcs Studio snaps your widgets magnetically in place based on the position of neighbouring widgets.</td>
    </tr>
    <tr>
        <th class="code">Auto Zoom to Fit All</th>
        <td>Controls whether the display as a whole should be zoomed in at runtime such that it fits its available space</td>
    </tr>
</table>
