---
layout: default
permalink: /docs/server/SPNEGO_AuthModule/
sidebar: yes
---

The SPNEGO AuthModule supports authentication of users via an external Kerberos server. It does not support authorization and must therefore be stacked together with another AuthModule.

### Class Name
{% javadoc org/yamcs/security/SpnegoAuthModule %}


### Configuration Options

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">krbRealm</td>
    <td class="code">string</td>
    <td>Accept only users from this realm</td>
  </tr>
  <tr>
    <td class="code">stripRealm</td>
    <td class="code">boolean</td>
    <td>Whether to strip the realm from the username (e.g. 'user@REALM' becomes just 'user'). Use this only when <tt>krbRealm</tt> is also set. Default: <tt>false</tt></td>
  </tr>
  <tr>
    <td class="code">krb5.conf</td>
    <td class="code">string</td>
    <td>Absolute path to the applicable <tt>krb5.conf</tt> file.</td>
  </tr>
  <tr>
    <td class="code">jaas.conf</td>
    <td class="code">string</td>
    <td>Absolute path to the applicable <tt>jaas.conf</tt> file.</td>
  </tr>
</table>

The `jaas.conf` file must contain login modules called <tt>UserAuth</tt> and <tt>Yamcs</tt>. Details are beyond the scope of this manual.
