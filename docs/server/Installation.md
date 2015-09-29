---
layout: default
permalink: /docs/server/Installation/
sidebar: yes
---

#### Dependencies

<table class="inline">
	<tr>
		<th>OS</th>
		<td>Linux or Windows, 32bit or 64bit</td>
	</tr>
	<tr>
		<th>Hardware</th>
		<td>RAM &gt;= 1Gb, HD &gt;= 500Gb (dependent on amount of data archived)</td>
	</tr>
	<tr>
		<th>Java runtime (JRE)</th>
		<td>&gt;= version 1.8</td>
	</tr>
	<tr>
		<th>Tokyocabinet</th>
		<td>&gt;= version 1.4</td>
	</tr>
	<tr>
		<th>libjtokyocabinet</th>
		<td>&gt;= version 1.22</td>
	</tr>
</table>

#### Installation

Yamcs is delivered as an rpm (or deb) package and installation is achieved using the rpm command:

    $ rpm -U yamcs-version.noarch.rpm
    
After installing the rpms, the following directories are created under `/yamcs/opt`:
        
* `bin` Contains shell scripts for starting the different programs
* `cache` Contains cached serialized java files for the Mission Database. This has to be writable by the user `yamcs`.
* `etc` Contains all the configuration files
* `lib` Contains the jars required by Yamcs. `lib/ext` is where extensions reside.
* `log` Contains the log files of Yamcs. It has to be writable by the user `yamcs`.
    
In addition to the core Yamcs package, there are other proprietary extensions. For example:

* yamcs-cdmcs
    Provides loading of TM/TC directly from CD-MCS MDB or from SCOE files (only TM) and also provides the CORBA (CIS) protocol for communicating with USS and MCS Tools

* yamcs-dass
    Provides TM/TC receivers/senders via the DaSS protocol
    
* yamcs-busoc
    Provides the SOLAR (ISS/Columbus payload) event decoder and a few SOLAR specific derived variables.
    
* yamcs-erasmus
    Provides the EDR and FASTER (also ISS/Columbus payloads/instruments) event decoder and some specific derived variables.
        
<div class="hint">
	The extensions are not part of the Yamcs open-source release. They only make sense in the specific USOC environment.
</div>
    
#### Configuration
The Yamcs configuration files are encoded using the yaml format. This format allows to encode in a human readable way (unlike XML) the most common data types: numbers, strings, lists and maps. For detailed syntax rules, please see [http://www.yaml.org](http://www.yaml.org).

The starting configuration file is `yamcs.yaml`. It contains a list of Yamcs instances. For each instance, a file called `yamcs.instance-name.yaml` defines all the components that are part of the instance. Depending on which components are selected, different configuration files are needed.

The logging level is configured  in `logging.yamcs-server.properties`. This file is used to configure the standard Java logging framework, and is encoded in standard java properties format. The formatting of the java properties files is described here: [http://docs.oracle.com/javase/6/docs/api/java/util/Properties.html#load(java.io.Reader)](http://docs.oracle.com/javase/6/docs/api/java/util/Properties.html#load(java.io.Reader)).
    
#### Updating
Upgrading is done using the rpm command:

    rpm -U yamcs-version.noarch.rpm

If a configuration file (in the `etc` directory) has been updated with regard to the previous installed version, the old files will be saved with the extension `.rpmsave`. The user then has to inspect the difference between the two version and to implement the newly added options into the old configuration files.


#### Removing
Yamcs Server can be removed (erased) using the rpm command:

    rpm -e yamcs

#### Starting the Yamcs Server
Normally the Yamcs Server should be configured to start automatically on boot via `/etc/init.d/yamcs-server`. The command will automatically run itself as a lower privilege user (username `yamcs`), but must initially be run as root for this to happen. Yamcs Server can be started and stopped as a service via commands such as `service yamcs-server start` and `service yamcs-server stop`. These commands use the init.d script and will run Yamcs as the appropriate user. It is also possible to directly use the script `/opt/yamcs/bin/yamcs-server.sh`, but use of the `service` command is preferred.

Regardless of how Yamcs server is started, all the options are read from the configuration file `yamcs.yaml`.
