---
layout: default
sidebar: yes
permalink: /docs/tools/PP_Simulation/
---

The Yamcs PP Simulation user interface allows to browse a library of scenarios, and select the one that should be played by the Yamcs PP Simulation Provider.


### Installing
	
#### Dependencies
<table class="inline">
    <tr>
        <th>OS</th>
        <td>Linux or Windows, 32bit or 64bit</td>
    </tr>
    <tr>
        <th width="1">Java runtime (JRE)</th>
        <td>Version &gt;= 1.8</td>
    </tr>
</table>

#### Installation
The Yamcs PP Simulation is delivered as part of an archived client tools package. The package does not need to be installed, just extracted to a suitable location. The tools can be run from the extracted location using starting scripts found in the `bin/` folder.

#### Updating
Updated applications are made available as an archived client tools package. This should be extracted into its own folder, separate to any previous installation. The configuration files in `etc/` can be copied from a previous installation into the new installation.
	
#### Removing
To remove an installation, delete the extracted folder.

### Enable PP Simulation Data Link
In order to play simulation scenarios, it is needed to add a SimulationPpProvider to the PP Providers list of the Yamcs instance.

Below is config example that should be added in the config file of the yamcs instance:

```yaml
ppProviders:
    - class: org.yamcs.simulation.SimulationPpProvider
      stream: pp_realtime
      args: {simulationDataPath: "/opt/yamcs/etc/simulation.xml"}
```

### Starting the Tool
On Windows and OS X, start the PP Simulation interface with the command
 
    $ yamcs-pp-simulation.sh

On Windows use the bat-script instead:

    $ yamcs-pp-simulation.bat

After start-up, the menu entry **Options > Directories** has to be used to select:

* the "scenario library" path to a local directory containing XML scenario files.
* the "running scenario target" to the file that specified in the yamcs config file for parameter `simulationDataPath`

### User Interface

![Yamcs PP Simulation user interface](/assets/tools/yamcs-pp-simulation.png){: .center-image }

To run a scenario in Yamcs:

* Browse to the desired scenario in the Library section
* Click **Select**
* (re)Enable the simulation data link from Yamcs Monitor

The simulation link in Yamcs Monitor should be disabled and enabled again to take into account the new simulation scenario. Below is a picture of the Yamcs Monitor with the simulation data link enabled:

![Simulation PP Link in Yamcs Monitor](/assets/tools/yamcs-pp-simulation-monitor.png){: .center-image }

### Scenario file format
The scenarios are defined in XML files that follow the schema `scenario_data.xsd`, available in the Yamcs source code.

Examples of scenario files can be found in Yamcs sources, at location `yamcs-simulation/src/test/resources`.
