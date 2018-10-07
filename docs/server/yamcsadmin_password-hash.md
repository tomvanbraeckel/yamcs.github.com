---
layout: default
sidebar: yes
permalink: /docs/server/yamcsadmin_password-hash/
---

<div class="man-title">NAME</div>
<div class="man-section">
    yamcsadmin password-hash &ndash; Generate password hash for use in users.yaml
</div>

<div class="man-title">SYNOPSIS</div>
<div class="man-synopsis">
    yamcsadmin password-hash
</div>

<div class="man-title">DESCRIPTION</div>
<div class="man-section">
    Promps to enter and confirm a password, and generates a randomly salted PBKDF2 hash of this password. This hash may be used in users.yaml instead of the actual password, and allows verifying user passwords without storing them.
</div>
