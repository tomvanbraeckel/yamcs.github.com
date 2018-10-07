---
layout: default
sidebar: yes
permalink: /docs/server/yamcsadmin_xtcedb/
---

<div class="man-title">NAME</div>
<div class="man-section">
    yamcsadmin xtcedb &ndash; Provides information about the XTCE database
</div>

<div class="man-title">SYNOPSIS</div>
<div class="man-synopsis">
    yamcsadmin xtcedb [-f FILE] COMMAND
</div>

<div class="man-title">OPTIONS</div>
<div class="man-section">
    <dl>
        <dt class="arg">-f FILE</dt>
        <dd>Use this file instead of default mdb.yaml</dd>
    </dl>
</div>

<div class="man-title">COMMANDS</div>
<div class="man-section">
    <dl>
        <dt class="arg">listConfigs</dt>
        <dd>List the MDB configurations defined in mdb.yaml</dd>
        <dt class="arg">print</dt>
        <dd>Print the contents of the XTCE DB</dd>
        <dt class="arg">verify</dt>
        <dd>Verify that the XTCE DB can be loaded</dd>
    </dl>
</div>

<p>&nbsp;</p>

### yamcsadmin xtcedb listConfigs

<div class="man-title">NAME</div>
<div class="man-section">
    yamcsadmin xtcedb listConfigs &ndash; List the MDB configurations defined in mdb.yaml
</div>

<div class="man-title">SYNOPSIS</div>
<div class="man-synopsis">
    yamcsadmin xtcedb listConfigs
</div>

<p>&nbsp;</p>

### yamcsadmin xtcedb print

<div class="man-title">NAME</div>
<div class="man-section">
    yamcsadmin xtcedb print &ndash; Print the contents of the XTCE DB
</div>

<div class="man-title">SYNOPSIS</div>
<div class="man-synopsis">
    yamcsadmin xtcedb print CONFIG
</div>

<div class="man-title">POSITIONAL ARGUMENTS</div>
<div class="man-section">
    <dl>
        <dt class="arg">CONFIG</dt>
        <dd>Config name.</dd>
    </dl>
</div>

<p>&nbsp;</p>

### yamcsadmin xtcedb verify

<div class="man-title">NAME</div>
<div class="man-section">
    yamcsadmin xtcedb verify &ndash; Verify that the XTCE DB can be loaded
</div>

<div class="man-title">SYNOPSIS</div>
<div class="man-synopsis">
    yamcsadmin xtcedb verify CONFIG
</div>

<div class="man-title">POSITIONAL ARGUMENTS</div>
<div class="man-section">
    <dl>
        <dt class="arg">CONFIG</dt>
        <dd>Config name.</dd>
    </dl>
</div>
