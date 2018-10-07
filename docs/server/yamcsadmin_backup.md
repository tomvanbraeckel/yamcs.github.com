---
layout: default
sidebar: yes
permalink: /docs/server/yamcsadmin_backup/
---

<div class="man-title">NAME</div>
<div class="man-section">
    yamcsadmin backup &ndash; Perform and restore backups
</div>

<div class="man-title">SYNOPSIS</div>
<div class="man-synopsis">
    yamcsadmin backup COMMAND
</div>

<div class="man-title">COMMANDS</div>
<div class="man-section">
    <dl>
        <dt class="args">create</dt>
        <dd>Create a new backup</dd>
        <dt class="args">delete</dt>
        <dd>Delete a backup</dd>
        <dt class="args">list</dt>
        <dd>List the existing backups</dd>
        <dt class="args">restore</dt>
        <dd>Restore a backup.</dd>
    </dl>
</div>

<p>&nbsp;</p>

### yamcsadmin backup create

<div class="man-title">NAME</div>
<div class="man-section">
    yamcsadmin backup create &ndash; Create a new backup
</div>

<div class="man-title">SYNOPSIS</div>
<div class="man-synopsis">
    yamcsadmin backup create [--dbDir DIR] [--backupDir DIR]
</div>

<div class="man-title">OPTIONS</div>
<div class="man-section">
    <dl>
        <dt class="arg">--dbDir DIR</dt>
        <dd>Database directory.</dd>
        <dt class="arg">--backupDir DIR</dt>
        <dd>Backup Directory.</dd>
    </dl>
</div>

<p>&nbsp;</p>

### yamcsamdin backup delete

<div class="man-title">NAME</div>
<div class="man-section">
    yamcsadmin backup delete &ndash; Delete a backup
</div>

<div class="man-title">SYNOPSIS</div>
<div class="man-synopsis">
    yamcsadmin backup delete [--backupDir DIR] [--backupId ID]
</div>

<div class="man-title">OPTIONS</div>
<div class="man-section">
    <dl>
        <dt class="arg">--backupDir DIR</dt>
        <dd>Backup Directory.</dd>
        <dt class="arg">--backupId ID</dt>
        <dd>Backup ID.</dd>
    </dl>
</div>

<p>&nbsp;</p>

### yamcsadmin backup list

<div class="man-title">NAME</div>
<div class="man-section">
    yamcsadmin backup list &ndash; List the existing backups
</div>

<div class="man-title">SYNOPSIS</div>
<div class="man-synopsis">
    yamcsadmin backup list [--backupDir DIR]
</div>

<div class="man-title">OPTIONS</div>
<div class="man-section">
    <dl>
        <dt class="arg">--backupDir DIR</dt>
        <dd>Backup Directory.</dd>
    </dl>
</div>

<p>&nbsp;</p>

### yamcsadmin backup restore

<div class="man-title">NAME</div>
<div class="man-section">
    yamcsadmin backup restore &ndash; Restore a backup
</div>

<div class="man-title">SYNOPSIS</div>
<div class="man-synopsis">
    yamcsadmin backup restore [--backupDir DIR] [--backupId ID] [--restoreDir DIR]
</div>

<div class="man-title">DECRIPTION</div>
<div class="man-section">
    Note that backups can only be restored when Yamcs is not running.
</div>

<div class="man-title">OPTIONS</div>
<div class="man-section">
    <dl>
        <dt class="arg">--backupDir DIR</dt>
        <dd>Backup Directory.</dd>
        <dt class="arg">--backupId ID</dt>
        <dd>Backup ID. If not specified, defaults to the last backup</dd>
        <dt class="arg">--restoreDir DIR</dt>
        <dd>Directory where to restore the backup</dd>
    </dl>
</div>
