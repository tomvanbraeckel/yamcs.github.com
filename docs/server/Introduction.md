---
layout: default
sidebar: yes
chapter: yes
permalink: /docs/server/Introduction/
---

Yamcs Server is the essential part of Yamcs implementing all the logic of monitoring and control of remote devices. It interfaces on one side with the device being monitored and controlled and on the other side with end user applications such as telemetry displays, commanding applications, etc.

Although the Yamcs Server is indeed providing server based functionality, it does provide out of the box an embeeded web server with can be used for administration and even for limited monitoring applications. 

Yamcs is implemented completely in Java, however it relies on external storage engine for data archiving. Currently the used storage engine is [RocksDB](http://rocksdb.org/). The platform of choice for running the Yamcs server is Linux x64, but it does run pretty well on Mac OS X and even on Windows with the latest versions of RocksDB.

Although the Yamcs Server is used primarily as a server, it is being successfully used as a library for doing various tasks, mainly related to processing of packet telemetry according to XTCE definitions. 
This manual describes how to use Yamcs as a server. If you want to use it for other purposes, please contact the developers at [Yamcs mailing list](https://groups.google.com/forum/#!forum/yamcs).



