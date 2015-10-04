---
layout: default
sidebar: yes
chapter: yes
permalink: /docs/server/Mission_Database/
---

Currently, the Yamcs Mission Database is split into three parts:

* Telemetry is described according to the XTCE structure.
* Telecommand is described according to the CD-MCS MDB structure.
* Processed Parameters is simply a list of names, according to Yamcs own structure.

Eventually, these three parts will be merged into one single XTCE hierarchical structure.

For faster access, the database is cached serialized on disk in the cache directory. Each of the three parts mentioned above create two files, one storing the data itself and the other one storing the time when the cache file has been created. These files should be considered Yamcs internal and are subject to change.
 
Different loaders are possible for each database type.
