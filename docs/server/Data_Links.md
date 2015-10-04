---
layout: default
sidebar: yes
chapter: yes
permalink: /docs/server/Data_Links/
---
Data Links represent special components that communicate with the external world. There are three types of Data Links: TM (called TM Providers), TC (called TC Uplinkers) and PP (called PP Providers). TM and PP receive telemetry packets or parameters and inject them into the realtime or dump TM or PP streams. The TC data links subscribe to the realtime TC stream and send data to the external systems.
   
Note that any stream (like the realtime TM stream) can be linked to a HornetQ address, making it possible to inject data externally. However, the Data Links can report their status via client tools and can also be controlled to connect/disconnect to/from the data sources.
