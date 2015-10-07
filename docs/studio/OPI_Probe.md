---
layout: default
sidebar: yes
permalink: /docs/studio/OPI_Probe/
---

Right-click on a widget backed by a PV, and select **Process Variable > OPI Probe**. This opens the OPI Probe view with:

* In the **Value** tab, a meter indicating the validity range. This is however not fully implemented yet, and therefore often shows a very large range of values.
* In the tab **Trend**, a graphical evolution of this PVs value. There is currently no way to navigate to archived data.

![OPI Probe](/assets/studio/opi-probe.png){: .center-image }

<div class="hint">
    Given the similarities, we are likely to bring the content provided by <a href="/docs/studio/PV_Info">PV Info</a> and OPI Probe windows together in one dialog. We also foresee improvements to explore archived data.
</div>
