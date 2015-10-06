---
layout: default
sidebar: yes
permalink: /docs/studio/Monitor_Widgets/
---

#### LED
By default LED widgets are dark green, and light up when the connected PV is non-zero. Using the **State Count** the number of states can be increased to more than two. When doing so, a number of extra properties will be added in the Properties view. You then need to set explicit colors per value.

![LED](/assets/studio/led.png){: .center-image }

#### Image Boolean Indicator
With the Image Boolean Indicator you can render images depending on the ON or OFF state of the connected PV. The images need to be part of your workspace.

Among other use cases, this widget provides a practical way to replace the default LED widget with your own custom styling.

![LED](/assets/studio/image-boolean-indicator.png){: .center-image }

#### Text Update
The Text Update widget shows the textual value of the connected PV. The format can be controlled using properties like **Precision** and **Format Type**.

Both the background and the foreground color can be made alarm-sensitive. This will then apply the alarm colors that are defined in the color scheme.

Like Labels, Text Update widgets are drawn in a bounding box which you can control on the canvas by dragging the handles, or by finetuning the properties **Width** and **Height**.

![Text Update](/assets/studio/text-update.png){: .center-image }

#### Meter
The Meter widget shows the numeric value of the connected PV on a meter. The exact display of this widget can be controlled using various properties, among which colors for the needle, LOLO, LO, HI and HIHI values, major tick separation, as well as various toggles for the different elements that a meter is composed of.

![Meter](/assets/studio/meter.png){: .center-image }


#### Progress Bar
A bar graph widget that shows the numeric value of the connected PV as a bar or indicator.

![Progress Bar](/assets/studio/progress-bar.png){: .center-image }

#### Gauge
The Gauge widget shows the numeric value of the connected PV on a gauge. The exact display of this widget can be controlled using various properties, among which colors for the needle, LOLO, LO, HI and HIHI values, major tick separation, as well as various toggles for the different elements that a gauge is composed of.

![Gauge](/assets/studio/gauge.png){: .center-image }


#### Thermometer
Specialised form of the Progress Bar widget that shows the numeric value of the connected PV as a thermometer.

![Thermometer](/assets/studio/thermometer.png){: .center-image }

#### Tank
Specialised form of the Progress Bar widget that shows the numeric value of the connected PV as a tank.

![Tank](/assets/studio/tank.png){: .center-image }

#### XY Graph
Advanced widget for plotting the numeric value of one or more connected PVs. By combining the different properties it supports line charts, scatter charts, bar charts, step charts and area charts.

To show multiple traces in the same chart, increase the **Trace Count**. This will add a set of properties for every added trace. Every trace can be linked with a separate PV.

Use the **Show Toolbar** property to toggle visiblity of a toolbar. When visible, this toolbar can be used by the operator to perform zooming operations on the plot.

![XY Graph](/assets/studio/xy-graph.png){: .center-image }

#### Intensity Graph
Advanced widget for diplaying a 2D array as an image. This widget is meant to be used in combination with scripts. Further documentation pending.

![Intensity Graph](/assets/studio/intensity-graph.png){: .center-image }

#### Byte Monitor
Specialised form of the LED widget that shows the numeric long value of the connected PV as a series of LEDs, each LED lighting up if the corresponding bit is <tt>true</tt>. The rightmost or bottom bit corresponds with the least-significant bit of the PV, but this can be reversed using the **Reverse Bits** property.

![Byte Monitor](/assets/studio/byte-monitor.png){: .center-image }
