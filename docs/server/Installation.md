---
layout: default
permalink: /docs/server/Installation/
sidebar: yes
---

#### Dependencies

<table class="inline">
	<tr>
		<th>OS</th>
		<td>Linux 64bit</td>
	</tr>
	<tr>
		<th>Hardware</th>
		<td>RAM &gt;= 1Gb, HD &gt;= 500Gb (dependent on amount of data archived)</td>
	</tr>
	<tr>
		<th>Java runtime (JRE)</th>
		<td>&gt;= version 1.8</td>
	</tr>	
</table>

#### Installation

Yamcs is delivered as an rpm (or deb) package and installation is achieved using the rpm command:

    $ rpm -U yamcs-version.noarch.rpm
    
After installing the rpms, the following directories are created under <tt>/yamcs/opt</tt>:
        
<table class="inline">
	<tr>
		<th class="code">bin</th>
		<td>Contains shell scripts for starting the different programs</td>
	</tr>
	<tr>
		<th class="code">cache</th>
		<td>Contains cached serialized java files for the Mission Database. This has to be writable by the user <tt>yamcs</tt></td>
	</tr>
	<tr>
		<th class="code">etc</th>
		<td>Contains all the configuration files</td>
	</tr>
	<tr>
		<th class="code">lib</th>
		<td>Contains the jars required by Yamcs. <tt>lib/ext</tt> is where extensions reside</td>
	</tr>
	<tr>
		<th class="code">log</th>
		<td>Contains the log files of Yamcs. It has to be writable by the user <tt>yamcs</tt></td>
	</tr>
</table>
    
In addition to the default Yamcs package, there are other proprietary extensions. For example:

* <tt>yamcs-cdmcs</tt>
    Provides loading of TM/TC directly from CD-MCS MDB or from SCOE files (only TM) and also provides the CORBA (CIS) protocol for communicating with USS and MCS Tools

* <tt>yamcs-dass</tt>
    Provides TM/TC receivers/senders via the DaSS protocol
    
* <tt>yamcs-busoc</tt>
    Provides the SOLAR (ISS/Columbus payload) event decoder and a few SOLAR specific derived variables.
    
* <tt>yamcs-erasmus</tt>
    Provides the EDR and FASTER (also ISS/Columbus payloads/instruments) event decoder and some specific derived variables.
        
<div class="hint">
	The extensions are not part of the Yamcs open-source release. They only make sense in the specific USOC environment.
</div>
    
#### Configuration
The Yamcs configuration files are encoded using the yaml format. This format allows to encode in a human readable way (unlike XML) the most common data types: numbers, strings, lists and maps. For detailed syntax rules, please see [http://www.yaml.org](http://www.yaml.org).

The starting configuration file is <tt>etc/yamcs.yaml</tt>. It contains a list of Yamcs instances. For each instance, a file called <tt>etc/yamcs.instance-name.yaml</tt> defines all the components that are part of the instance. Depending on which components are selected, different configuration files are needed.

The logging level is configured  in [etc/logging.yamcs-server.properties](/docs/server/logging.yamcs-server.properties).

#### Upgrading
Upgrading is done using the rpm command:

    rpm -U yamcs-version.noarch.rpm

If a configuration file (in the <tt>etc</tt> directory) has been updated with regard to the previous installed version, the old files will be saved with the extension <tt>.rpmsave</tt>. The user then has to inspect the difference between the two versions and to implement the newly added options into the old configuration files.


#### Removing
Yamcs Server can be removed (erased) using the rpm command:

    rpm -e yamcs

#### Starting the Yamcs Server
Normally the Yamcs Server should be configured to start automatically on boot via <tt>/etc/init.d/yamcs-server</tt>. The command will automatically run itself as a lower privilege user (username <tt>yamcs</tt>), but must initially be run as root for this to happen. Yamcs Server can be started and stopped as a service via commands such as <tt>service yamcs-server start</tt> and <tt>service yamcs-server stop</tt>. These commands use the init.d script and will run Yamcs as the appropriate user. It is also possible to directly use the script <tt>/opt/yamcs/bin/yamcs-server.sh</tt>, but use of the <tt>service</tt> command is preferred.

Regardless of how Yamcs server is started, all the options are read from the configuration file <tt>etc/yamcs.yaml</tt>.
