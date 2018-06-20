---
layout: default
permalink: /docs/server/SPNEGO_AuthModule/
sidebar: yes
---

The SPNEGO AuthModule supports authentication of users via an external Kerberos server. It does not support authorization and must therefore be stacked together with another AuthModule.

### Class Name
[<tt>org.yamcs.security.SpnegoAuthModule</tt>](https://javadoc.io/page/org.yamcs/yamcs-core/latest/org/yamcs/security/SpnegoAuthModule.html)


### Configuration Options

<dl>
  <dt>krbRealm</dt>
  <dd>
    <b>Required.</b> The Kerberos realm
  </dd>
  <dt>stripRealm</dt>
  <dd>Whether to strip the realm from the username (e.g. 'user@REALM' becomes just 'user')</dd>
  <dt>krb5.conf</dt>
  <dd>Absolute path to the applicable <tt>krb5.conf</tt> file.</dd>
  <dt>jaas.conf</dt>
  <dd>Absolute path to the applicable <tt>jaas.conf</tt> file.</dd>
</dl>

The <tt>jaas.conf</tt> file must contain login modules called <tt>UserAuth</tt> and <tt>Yamcs</tt>. Details are beyond the scope of this manual.
