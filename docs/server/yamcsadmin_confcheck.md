---
layout: default
sidebar: yes
permalink: /docs/server/yamcsadmin_confcheck/
---

<div class="man-title">NAME</div>
<div class="man-section">
    yamcsadmin confcheck &ndash; Check the configuration files of Yamcs
</div>

<div class="man-title">SYNOPSIS</div>
<div class="man-synopsis">
    yamcsadmin confcheck [--no-etc] [DIR]
</div>

<div class="man-title">POSITIONAL ARGUMENTS</div>
<div class="man-section">
    <dl>
        <dt class="arg">[DIR]</dt>
        <dd>
            Use this directory in preference for loading configuration files. If --no-etc is specified, all configuration files will be loaded from this directory. Note that the data directory (yamcs.yaml dataDir) will be changed before starting the services, otherwise there will be RocksDB LOCK errors if a yamcs server is running.
        </dd>
    </dl>
</div>

<div class="man-title">OPTIONS</div>
<div class="man-section">
    <dl>
        <dt class="arg">--no-etc</dt>
        <dd>
            Do not use any file from the default Yamcs etc directory. If this is specified, the argument config-dir becomes mandatory.
        </dd>
    </dl>
</div>
