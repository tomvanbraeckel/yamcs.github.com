---
layout: default
permalink: /docs/server/SCOS2K_Loader/
sidebar: yes
---

The SCOS2K loader loads MIB definitions as defined by SCOS-2000. To use it, you need to compile the project [yamcs-scos2k](https://github.com/yamcs/yamcs-scos2k) and copy the jar into the yamcs lib/ext directory.

Then you can add the following in the mdb.yaml:
<pre>
scos-mib:
  - type: "org.yamcs.scos2k.MibLoader"
    args: 
        path: "/path/to/ASCII/"
        # byte offset from beginning of the packet where the type and subType are read from     
        typeOffset: 7
        subTypeOffset: 8
        epoch: "UNIX"
</pre>


# Known problems and limitations
The SCOS-2K loader has been implemented as a proof of concept and only subjected to limited testing by loading a [TERMA TSC](https://ccs.terma.com/) test database and comparing the TM/TC decoding/encoding with the TSC. A number of known limitations are documented below.


To be fixed as soon as someone shows some interest in this project (please submit an [issue](https://github.com/yamcs/yamcs-scos2k/issues/new) if you want this fixed):

* the loader does not detect when the files have changed and does not reload the database. This is because it looks at the date  of the ASCII directory. As a workaround you can either remove the serialized MDB from ~/.yamcs or /opt/yamcs/cache or run "touch ASCII" to change the date of the directory.

* command verifiers are currently not loaded


Probably not immediate priority:

* delta monitoring checks (OCP_TYPE=D) not supported
* event generation (OCP_TYPE=E) not supported
* status consistency checks (OCP_TYPE=C, PCF_USCON=Y) not supported
* arguments of type "Command Id" (CPC_CATEG=A) are not supported. These can be used to insert one command inside another one. Instead a binary command argument is being used.
* SCOS 2K allows multiple command arguments with the same name. This is not supported in Yamcs (and in XTCE) so duplicate arguments are renamed arg_<n>  with n increasing for each argument. 
* no command stack support.
 
