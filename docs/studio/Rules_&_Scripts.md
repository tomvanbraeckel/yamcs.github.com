---
layout: default
sidebar: yes
permalink: /docs/studio/Rules_&_Scripts/
---

Making OPI displays is flexible using the [Palette](/docs/studio/Palette/) and the [Properties](/docs/studio/Properties/), but the resulting displays are still fairly static. But what if we want to make the position of a widget dynamic based on a PV? Or if we want to dynamically change widget colors?

### Rules
You may have noticed that every widget contains a **Rules** property. Rules are a user-friendly way for adding dynamic behaviour to widgets. They are most often used for changing other properties of that widget at runtime.



### Scripts
For more advanced dynamic runtime behaviour, we can write scripts (actually Rules are a thin layer on top of scripts). With scripts we can write arbitrary logic that can dynamically manipulate just about any property of a widget.

Yamcs Studio supports two dynamic languages: JavaScript and Python. Both languages can be used to the same effect, and are available without any external dependencies. As of now, there is no advanced editor support bundled with Yamcs Studio though, so scripts are edited with a plain text editor.

Documentation of the available functions is forthcoming until we stabilise our libraries. Until then, please have a look at the scripts in the sample projects to get an idea of the sort of manipulations that can be achieved.
