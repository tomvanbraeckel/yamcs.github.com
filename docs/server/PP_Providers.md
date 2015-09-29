---
layout: default
permalink: /docs/server/PP_Providers/
sidebar: yes
---

PP Providers are components that collect processed parameters (PP) from external sources and inject them into a Yamcs stream. They are defined in the instance configuration file as part of the `ppProviders` list.

Each PP Provider is defined in terms of a name (which allows identifying it in the Yamcs Monitor), a class (the java class instantiated by Yamcs to load the provider), a specification (used as an argument when instantiating the class) and the name of the stream where the data will be injected. There is also a property `enabledAtStartup` which allows to enable (default) or disable the PP provider for connecting to the external data source at the server startup.

### DasPpProvider
Implements processed parameters from DaSS.

At startup the DassPpProvider loads configuration properties defined in the configuration file `etc/dass.yaml`. It builds the list of processed parameters which have to be subscribed from the MDB taking all the UMI tables found in the configured CCU.

Once the list of processed parameters is built, it tries regularly to subscribe to any unsubscribed parameter. Using the Yamcs Monitor it is possible to stop the subscription to DaSS and to close the connection.

The processed parameters are made available to the subscribing clients, using names like opsname_PP where opsname is the original name of the processed parameter (i.e. name at the source).
        
Unlike CD-MCS the processed parameters are made available via Yamcs with the telemetry status received from DaSS. In CD-MCS the other attributes of the processed parameters are made available via other parameters like opsname_ST, etc. In Yamcs these are not initialized, even the subscription is refused.
        
The mapping between DaSS status and Yamcs parameters is documented in section <xref linkend="dass-pp-mapping"/>.

### MulticastPpProvider
Implements processed parameters received via multicast from the TMR

At startup the DassPpProvider loads configuration properties defined in the configuration file `etc/multicast.yaml` (see <xref linkend="multicast.yaml"/>). It builds the list of processed parameters which have to be considered from the MDB taking all the UMI tables found in the configured CCU.

The processed parameters are sent by TMR packetized in packets of variable size. Each packet is received in a UDP datagram.

The MulticastPpProvider uses some classes from the DaSS API to decode these packets which are then made available to the clients using the same mechanism and the same DaSS to CIS mapping like the DassPpProvider. The parameters which are not defined in the UMI maps loaded from the MDB are discarded.

Using the Yamcs Monitor the processing of packets can be enabled/disabled. In addition the MulticastPpProvider collects simple statistics with the number of UDP datagrams received and the number of processed parameters in the last datagram. These statistics can also be seen using the Yamcs Monitor.

### SimulationPpProvider
Some tests request data to be simulated. This can be achieved by using the SimulationPpprovider. This simulation pp provider uses in input scenarios that are defined in XML files.

The XML scenario file allows to describe the parameters sent, their generation time, acquisition time, engineering value and monitoring value. Parameters are organized in ‘sequence’ that can be repeated to allow more complex scenarios. The speed of the simulation can be defined, by setting the duration of a simulation step

The format of XML scenario file is defined in annex XXX

A user interface is available to visualize a library of scenario and select the scenario that YAMCS should play. This tool is documented in section XXX
