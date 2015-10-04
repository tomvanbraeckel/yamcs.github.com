---
layout: default
sidebar: yes
permalink: /docs/studio/Inspector_Windows/
---

There are a few standalone windows that can be opened for inspecting widgets. 

* TOC
{:toc}

### PV List
If you right-clicking anywhere in a display, and choose **Dump PV List**, you will see a window listing the unique PVs that are defined inside any widget of that display. This is mostly useful for quick-fixing runtime issues.

![Dump PV List](/assets/studio/dumppv.png){: .center-image }

### PV Info
Right-click on a widget backed by a PV, and select **PV Info**. This opens a window where you get extra information on the PVs in that widget. If there are mutliple PVs for that widget, select the PV of your interest using the top dropdown selector. For Yamcs parameters, you will see various properties that were defined in the Mission Database. 

Currently the displayed information is mostly static, but we plan on improving this view to:

* show continuously updated information on the latest value, and its alarm info.
* show which context is applicable based on the latest value, for context-dependent Mission Database definitions (e.g. *alarm rule <tt>x</tt> only applies in contingency mode*).

<table>
    <tr>
        <td style="width: 50%">
            <img src="/assets/studio/pvinfo-pv.png" style="width: 100%">
        </td>
        <td style="width: 50%">
            <img src="/assets/studio/pvinfo-para.png" style="width: 100%">
        </td>
    </tr>
</table>

### OPI Probe
Right-click on a widget backed by a PV, and select **Process Variable > OPI Probe**. This opens the OPI Probe view which shows you in the tab **Trend** a graphical evolution of this PVs value. There is currently no way to navigate to archived data.

![OPI Probe](/assets/studio/opi-probe.png){: .center-image }

<div class="hint">
    Given the similarities, in the future, we are likely to bring the content provided by the PV Info and OPI Probe windows together in one dialog. We also foresee improvements to explore archived data.
</div>
