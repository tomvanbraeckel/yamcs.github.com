---
layout: default
permalink: /docs/server/LDAP_AuthModule/
sidebar: yes
---

The LDAP AuthModule supports authentication and authorization of users via the LDAP protocol.

This module adds privileges to users through the use of roles: a user has specific roles, and some role is required for a specific privilege. All the user, role and privilege definitions are looked up in the LDAP database. Yamcs reads only LDAP objects of type <tt>groupOfNames</tt>.

The algorithm used to build the list of user privileges is as follows:

* From the path configured by <tt>rolePath</tt> find all the roles associated to the user. The roles defined in LDAP must contain references using the member attribute to objects <tt>member=uid=username</tt> from the <tt>userPath</tt>.
* For each role found previously, do a search in the corresponding system, tc, tm packet or tm parameter path using the match <tt>member=cn=role_name</tt>. The cn of the matching entries is used to build the list of privileges that the user has.

<div class="hint">
  This class can be stacked with other AuthModules such that it is responsible for either authentication or authorization. In the case of authorization read-only access to the LDAP database is assumed.
</div>

### Class Name
[<tt>org.yamcs.security.LdapAuthModule</tt>](https://www.yamcs.org/yamcs/javadoc/index.html?org/yamcs/security/LdapAuthModule.html)

### Configuration Options

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">host</td>
    <td class="code">string</td>
    <td><b>Required.</b> The LDAP host</td>
  </tr>
  <tr>
    <td class="code">userPath</td>
    <td class="code">string</td>
    <td><b>Required.</b> The path to user definitions</td>
  </tr>
  <tr>
    <td class="code">rolePath</td>
    <td class="code">string</td>
    <td>The path to role definitions</td>
  </tr>
  <tr>
    <td class="code">systemPath</td>
    <td class="code">string</td>
    <td>The path to system privileges</td>
  </tr>
  <tr>
    <td class="code">tmParameterPath</td>
    <td class="code">string</td>
    <td>The path to <tt>ReadParameter</tt> object privileges</td>
  </tr>
  <tr>
    <td class="code">tmPacketPath</td>
    <td class="code">string</td>
    <td>The path to <tt>ReadPacket</tt> object privileges</td>
  </tr>
  <tr>
    <td class="code">tcPath</td>
    <td class="code">string</td>
    <td>The path to <tt>Command</tt> object privileges</td>
  </tr>
</table>
