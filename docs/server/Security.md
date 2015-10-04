---
layout: default
sidebar: yes
chapter: yes
permalink: /docs/server/Security/
---

This chapter describes the authentication and authorization mechanisms implemented in the Yamcs Server. Please note that these are in effect only when privileges are enabled by setting `enabled: true` in `etc/privileges.yaml` (see <xref linkend="privileges.yaml"/>).

If privileges are enabled, the Yamcs Server will connect to LDAP and read the user, roles and privileges from the directory paths specified in the configuration file above.

If privileges are disabled, the Yamcs Server will not even attempt to connect to LDAP and will assume that any user has all privileges required for the operations attempted.
