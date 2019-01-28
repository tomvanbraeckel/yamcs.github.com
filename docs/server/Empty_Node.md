---
layout: default
permalink: /docs/server/Empty_Node/
sidebar: yes
---

This "loader" allows to create an empty node (SpaceSystem) with a given name. The loader has been added in version 4.8.2 of Yamcs.


For example this configuration will create two parallel nodes "/N1" and "/N2" and underneath each of them, load the xls files of the simulator.
<pre>
mdb:
  - type: "emptyNode"
    spec: "N1"
    subLoaders:
      - type: "sheet"
        spec: "mdb/simulator-ccsds.xls"
        subLoaders:
          - type: "sheet"
            spec: "mdb/landing.xls"

  - type: "emptyNode"
    spec: "N2"
    subLoaders:
      - type: "sheet"
        spec: "mdb/simulator-ccsds.xls"
        subLoaders:
          - type: "sheet"
            spec: "mdb/landing.xls"
</pre>
