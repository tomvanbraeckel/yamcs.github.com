---
layout: default
sidebar: yes
permalink: /docs/server/yamcsadmin/
---

<div class="man-title">NAME</div>
<div class="man-section">
    yamcsadmin &ndash; Tool for local Yamcs administration
</div>

<div class="man-title">SYNOPSIS</div>
<div class="man-synopsis">
    yamcsadmin [--etc-dir DIR] COMMAND
</div>

<div class="man-title">OPTIONS</div>
<div class="man-section">
    <dl>
        <dt class="arg">--etc-dir DIR</dt>
        <dd>Override default Yamcs configuration directory</dd>
        <dt class="arg">-h, --help</dt>
        <dd>Show usage</dd>
        <dt class="arg">-v, --version</dt>
        <dd>Print version information and quit</dd>
    </dl>
</div>

<div class="man-title">COMMANDS</div>
<div class="man-section">
    <dl>
        <dt><a href="/docs/server/yamcsadmin_backup/">backup</a></dt>
        <dd>Perform and restore backups</dd>
        <dt><a href="/docs/server/yamcsadmin_confcheck/">confcheck</a></dt>
        <dd>Check the configuration files of Yamcs</dd>
        <dt><a href="/docs/server/yamcsadmin_parchive/">parchive</a></dt>
        <dd>Parameter Archive operations</dd>
        <dt><a href="/docs/server/yamcsadmin_password-hash/">password-hash</a></dt>
        <dd>Generate password hash for use in users.yaml</dd>
        <dt><a href="/docs/server/yamcsadmin_rocksdb/">rocksdb</a></dt>
        <dd>Provides low-level RocksDB data operations</dd>
        <dt><a href="/docs/server/yamcsadmin_xtcedb/">xtcedb</a></dt>
        <dd>Provides information about the XTCE database</dd>
    </dl>
</div>
