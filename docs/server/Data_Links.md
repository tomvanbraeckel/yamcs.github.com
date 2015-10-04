---
layout: default
sidebar: yes
chapter: yes
permalink: /docs/server/Data_Links/
---
Data Links represent input or output flows to Yamcs. There are three types of Data Links: TM (called TM Providers), TC (called TC Uplinkers) and PP (called PP Providers). TM and PP receive telemetry packets or parameters and inject them into the realtime or dump TM or PP streams. The TC data links subscribe to the realtime TC stream and send data to external systems.

Note that any stream (like the realtime TM stream) can be linked to a HornetQ address, making it possible to inject data externally.

Data Links can report on their status and can also be controlled to connect or disconnect from its data source.
