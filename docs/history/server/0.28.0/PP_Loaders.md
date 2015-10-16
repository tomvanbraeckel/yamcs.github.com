---
layout: default
version: 0.28.0
permalink: /docs/server/0.28.0/PP_Loaders/
sidebar: yes
---

Processed Parameters represent parameters that are processed by systems outside Yamcs. Currently, the only such system supported is DaSS. Yamcs simply has to know the name of parameter and does not do any extra check (like out of limits, validity, etc). In addition, each parameter can be part of a group (which is just a string). The parameters part of the same group are stored together.

#### Excel Spreadsheet
This the Yamcs [Excel spreadsheets](/docs/server/Excel_Specification/) loader, which can define a full MDB based on the XTCE components: Telemetry, Telecommand, Process Parameters and Algorithms.

#### MDB PP Loader
The MDB PP loader scans a configured CD-MCS MDB (using direct Oracle connection) for all the end items of type <tt>UMI_MAPPING_TABLE</tt>. The first part of the Opsname (string before the underscore) is used as group name.

#### Flat-file PP Loader
The flat-file PP loader reads list of parameter names, groups and opsnames from a tab-separated file.
