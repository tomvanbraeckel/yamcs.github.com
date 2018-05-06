---
layout: default
sidebar: yes
chapter: yes
permalink: /docs/server/Data_Links/
---
Data Links represent input or output flows. There are three types of Data Links: TM, TC  and PP (Processed Parameter). TM and PP receive telemetry packets or parameters and inject them into the realtime or dump TM or PP streams. TC data links subscribe to the realtime TC stream and send data to external systems.

Note that any Yamcs Service can connect to external sources and inject data in the Streams. However, the Data Links can report on their status using a predefined interface and can also be controlled to connect or disconnect from their data source. This can be done from client applications such as Yamcs Studio.
