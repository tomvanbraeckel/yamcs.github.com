---
layout: default
permalink: /docs/server/Installation/
sidebar: yes
---

### Prerequisites

Yamcs Server runs on 64-bit Linux.

<table class="inline">
    <tr>
        <th>RAM</th>
        <td>&gt;= 1Gb</td>
    </tr>
    <tr>
        <th>HD</th>
        <td>&gt;= 500Gb (dependent on amount of data archived)</td>
    </tr>
    <tr>
        <th>Java Runtime Environment (JRE)</th>
        <td>&gt;= version 1.8</td>
    </tr>	
</table>

### Install Manually

Yamcs Server software is packaged in RPM format. To install:

    $ rpm -U yamcs-version.noarch.rpm

This command also works for upgrading. If a configuration file (in the <tt>etc</tt> directory) has been updated with regard to the previous installed version, the old files will be saved with the extension <tt>.rpmsave</tt>. The user then has to inspect the difference between the two versions and to implement the newly added options into the old configuration files.

To uninstall Yamcs Server use:

    $ rpm -e yamcs

Note that this will also remove the <tt>yamcs</tt> user.

### Install from Repository

Yamcs Server packages are distributed via yum and APT. Configure the Yamcs repository appropriate to your distribution following the [repository instructions](/downloads/Yum_Repository/).

#### RPM (RHEL, Fedora, CentOS)

Install via <tt>dnf</tt> (or <tt>yum</tt> on older distributions)

    $ dnf check-update
    $ sudo dnf install yamcs

#### RPM (SLE, openSUSE)

    $ sudo zypper refresh
    $ sudo zypper install yamcs

#### APT (Debian, Ubuntu)

    $ sudo apt-get update
    $ sudo apt-get install yamcs

### File Layout
    
After installing the rpms, the following directories are created under <tt>/opt/yamcs</tt>:
        
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
    <tr>
        <th class="code">mdb</th>
        <td>Empty directory where the mission database has to be located.</td>
    </tr>
</table>

    
In addition to the default Yamcs package, in order to get a running server, the yamcs-simulation rpm can also be installed:

      $ rpm -U yamcs-simulation-version.noarch.rpm
      
This package will provide default configuration files and MDB for running a simple simulation of a UAV.

In addition to the directories mentioned above, yamcs also uses <tt>/storage/yamcs-data</tt> to store the data (telemetry, telecomand, event archive). This directory has to be writable by the user <tt>yamcs</tt>. The location of the data directory can be changed by editing <tt>/opt/yamcs/etc/yamcs.yaml</tt>

In addition to the default Yamcs package, there are other proprietary extensions. For example:

* <tt>yamcs-cdmcs</tt>
    Provides loading of TM/TC directly from CD-MCS MDB or from SCOE files (only TM) and also provides the CORBA (CIS) protocol for communicating with USS and MCS Tools

* <tt>yamcs-dass</tt>
    Provides TM/TC receivers/senders via the DaSS protocol
    
* <tt>yamcs-spell</tt>
    Provides the modules required to use [SPELL](https://sourceforge.net/projects/spell-sat/) with Yamcs. SPELL is a procedure execution environment developed by [SES](www.ses.com). 
    
        
<div class="hint">
    The extensions are not part of the Yamcs open-source release. If you are interested in using them, please contact Space Applications Services.
</div>

### Configuration
Yamcs configuration files are written in YAML format. This format allows to encode in a human friendly way the most common data types: numbers, strings, lists and maps. For detailed syntax rules, please see [https://www.yaml.org](https://www.yaml.org).

The root configuration file is <tt>etc/yamcs.yaml</tt>. It contains a list of Yamcs instances. For each instance, a file called <tt>etc/yamcs.instance-name.yaml</tt> defines all the components that are part of the instance. Depending on which components are selected, different configuration files are needed.

### Starting Yamcs Server
Normally Yamcs Server should be configured to start automatically on boot via <tt>/etc/init.d/yamcs-server</tt>. The command will automatically run itself as a lower privilege user (username <tt>yamcs</tt>), but must initially be run as root for this to happen. Yamcs Server can be started and stopped as a service via commands such as <tt>service yamcs-server start</tt> and <tt>service yamcs-server stop</tt>. These commands use the init.d script and will run Yamcs as the appropriate user. It is also possible to directly use the script <tt>/opt/yamcs/bin/yamcsd</tt>, but use of the <tt>service</tt> command is preferred.
