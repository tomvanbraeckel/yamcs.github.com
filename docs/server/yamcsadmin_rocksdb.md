---
layout: default
sidebar: yes
permalink: /docs/server/yamcsadmin_rocksdb/
---

<div class="man-title">NAME</div>
<div class="man-section">
    yamcsadmin rocksdb &ndash; Provides low-level RocksDB data operations
</div>

<div class="man-title">SYNOPSIS</div>
<div class="man-synopsis">
    yamcsadmin rocksdb COMMAND
</div>

<div class="man-title">COMMANDS</div>
<div class="man-section">
    <dl>
        <dt class="arg">compact</dt>
        <dd>Compact rocksdb database</dd>
        <dt class="arg">bench</dt>
        <dd>Benchmark rocksdb storage engine</dd>
    </dl>
</div>

<p>&nbsp;</p>

### yamcsadmin rocksdb compact

<div class="man-title">NAME</div>
<div class="man-section">
    yamcsadmin rocksdb compact &ndash; Compact rocksdb database
</div>

<div class="man-title">SYNOPSIS</div>
<div class="man-synopsis">
    yamcsadmin rocksdb compact [--dbDir DIR] [--sizeMB SIZE]
</div>

<div class="man-title">OPTIONS</div>
<div class="man-section">
    <dl>
        <dt class="arg">--dbDir DIR</dt>
        <dd>Database directory.</dd>
        <dt class="arg">--sizeMB SIZE</dt>
        <dd>Target size of each SST file in MB (default is 256 MB).</dd>
    </dl>
</div>

<p>&nbsp;</p>

### yamcsadmin rocksdb bench

<div class="man-title">NAME</div>
<div class="man-section">
    yamcsadmin rocksdb bench &ndash; Benchmark rocksdb storage engine
</div>

<div class="man-title">SYNOPSIS</div>
<div class="man-synopsis">
    yamcsadmin rocksdb bench [--dbDir DIR] [--baseTime TIME] [--count COUNT]<br>
    &nbsp;&nbsp;&nbsp;&nbsp;[--duration HOURS]
</div>

<div class="man-title">OPTIONS</div>
<div class="man-section">
    <dl>
        <dt class="arg">--dbDir DIR</dt>
        <dd>Directory where the database will be created. A "rocksbench" archive instance wll be created in this directory</dd>
        <dt class="arg">--baseTime TIME</dt>
        <dd>Start inserting data with this time. Default: 2017-01-01T00:00:00</dd>
        <dt class="arg">--count COUNT</dt>
        <dd>The partition counts for the 5 frequencies: [10/sec, 1/sec, 1/10sec, 1/60sec and 1/hour]. It has to be specified as a string (use quotes).</dd>
        <dt class="arg">--duration HOURS</dt>
        <dd>The duration in hours of the simulated data. Default: 24</dd>
    </dl>
</div>

<div class="man-title">DESCRIPTION</div>
<div class="man-section">
     The benchmark consists of a table load and a few selects. The table is loaded with telemetry packets received at frequencies of [10/sec, 1/sec, 1/10sec, 1/60sec and 1/hour]. The table will be identical to the tm table and will contain a histogram on pname (=packet name). It is possible to specify how many partitions (i.e. how many different pnames) to be loaded for each frequency and the time duration of the data.
</div>
