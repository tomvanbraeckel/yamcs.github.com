---
layout: default
sidebar: yes
permalink: /docs/studio/OPI_Schema/
---

The default property values of any widget can be overriden via an **OPI Schema**. A schema is an OPI file like any other, but which contains a set of widgets whose properties are used as defaults.

This is best illustrated with an example. Let's say we want to modify the defaults of the LED widget. Create a new OPI file and add a LED to the canvas (anywhere).

![Default LED](/assets/studio/schema-green-led.png){: .center-image }

Make the LED bigger and change the colors.

![Supreme LED](/assets/studio/schema-red-led.png){: .center-image }

Save your changes. Then right-click your file and select **Use as OPI Schema**.

![OPI Schema](/assets/studio/mark-opi-schema.png){: .center-image }

Notice your schema file now shows a small decorator in the [Explorer](/docs/studio/Explorer/) view:

![Schema Decorator](/assets/studio/schema-decorator.png){: .center-image }

Whenever you add a new LED to any display, it will now by red and big by default. The same principle can be applied to any other properties of any of the available widgets.

A schema may contain multiple widgets, however if there are multiple widgets of the same type, only the first occurrence is considered. This is the widget that appears the highest in the [Outline](/docs/studio/Outline/) view .

Only one OPI Schema can be active at a time. To unset the active schema, Right-click it in the  [Explorer](/docs/studio/Explorer/) view and untick **Use as OPI Schema**. This will return Display Builder to its default behaviour.
