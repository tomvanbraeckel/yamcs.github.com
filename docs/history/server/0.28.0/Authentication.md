---
layout: default
version: 0.28.0
permalink: /docs/server/0.28.0/Authentication/
sidebar: yes
---

Yamcs allows both secure (SSL based) and non-secure connections. The level of authentication performed is directly related to the connection type:

* Non-secure connections: the GSSUP mechanism part of CSIv2 CORBA specifications is used to obtain information about username. Although a password is carried via this mechanism, it is not checked against anything to avoid the users being required to enter their password each time they start a Monitoring or Commanding Tool. **For this reason, non-secure connections should only be allowed from trusted environments**.
* Secure connections: these are based on SSL. The SSL connections require client authentication and the LDAP database is searched for the username based on the certificate. The certificate has to be placed in the LDAP attribute <tt>userCertificate</tt>.

### Asserted Identities
The CSIv2 CORBA specifications include a mechanism through which a user (typically corresponding to a proxy) can execute CORBA calls on behalf of other users. The mechanism is called identity assertion: the proxyuser asserts the identity of the real user.

The Yamcs Server supports the identity assertion mechanism, imposing at the same time some restrictions meant to improve security:

* Identity assertion can be made only over secure (SSL) connections. As mentioned above the client always has to authenticate over secure connections and the proxyuser LDAP entry has to define the proxyuser certificate.
* The LDAP entry for the user that asserts other identities (typically <tt>cn=proxyuser,ou=People,o=usoc</tt>) has to contain a subnode <tt>cn=assertedIdentities</tt> of type <tt>groupOfNames</tt> which has <tt>member</tt> attributes pointing to all the users whose identities can be asserted. If the proxyuser attempts to assert an identity not in the list, a NO_PERMISSION error will be thrown.
