---
layout: default
sidebar: yes
chapter: yes
permalink: /docs/server/Archive/
---
The Yamcs archive is divided in two parts:
* Stream Archive - stores time ordered tuples (t, v1, v2...vn) where t is the time and v1,v2,vn are values of various types. This is used for storing raw telemetry packets, 
  commands, events, alarms and processed parameters. The stream archive can be seen as a row-oriented archive and is optimized for access entire records (e.g. a packet or a group of processed parameters).

* Parameter Archive - stores time ordered parameter values. The parameter archive is column oriented archive and it is optimized for accessing a (relatively small)
  number of parameters over longer periods of time.
