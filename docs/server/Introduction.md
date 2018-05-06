---
layout: default
sidebar: yes
chapter: yes
permalink: /docs/server/Introduction/
---

Yamcs Server, or short Yamcs, is a central component for monitoring and controlling remote devices. Yamcs stores and processes packets, and provides an interface for end-user applications to subscribe to realtime or archived data. Typical use cases for such applications include telemetry displays and commanding tools.

![Typical Deployment](/assets/server/typical-deployment.png){: .center-image }

Yamcs ships with an embedded web server for administering the server, the mission databases or for basic monitoring tasks. For more advanced requirements, Yamcs exposes its functionality over a well-documented HTTP-based API.

Yamcs is implemented entirely in Java, but it does rely on an external storage engine for actual data archiving. Currently the storage engine is [RocksDB](http://rocksdb.org/). The preferred target platform is linux x64, but Yamcs can also be made to run on Mac OS X and Windows.

While Yamcs binaries are typically used to run the Yamcs Server, they can also be useful as a library for reusable tasks such as processing of packet telemetry according to XTCE definitions. This manual describes how to use Yamcs as a server. If you want to use it for other purposes, please contact the developers at [Yamcs mailing list](https://groups.google.com/forum/#!forum/yamcs).
