---
layout: default
sidebar: yes
permalink: /docs/studio/PV_Info/
---

Right-click on a widget backed by a PV, and select **PV Info**. This opens a window where you get extra information on the PVs in that widget. If there are multiple PVs for that widget, select the PV of your interest using the top dropdown selector. For Yamcs parameters, you will see various properties that were defined in the Mission Database. 

Currently the displayed information is mostly static, but we plan on improving this view to:

* show continuously updated information on the latest value, and its alarm info.
* show which context is applicable based on the latest value, for context-dependent Mission Database definitions (e.g. *alarm rule <tt>x</tt> only applies in contingency mode*).

![PV](/assets/studio/pvinfo-pv.png){: .center-image }
![Parameter Ifo](/assets/studio/pvinfo-para.png){: .center-image }
