---
layout: default
permalink: /docs/server/Fundamentals/
sidebar: yes
---

The **Mission Database** is a dictionary containing the description of all the telemetry packets, parameters and commands.

A Yamcs **instance** is used to provide a separation between different processing domains (basically different Mission Databases). Each instance has its own archive.

**Streams** are used to transfer data inside components of the same instance, running in the same Java Virtual Machine.

**Processors** are connection points for several different streams of the same instance (typically at least one TM and one TC) and processing data according to a Mission Database. Multiple processors can exist in the same instance, processing data for different time periods.

**Processor Clients** are TM monitoring and/or TC commanding applications (Yamcs Studio, USS, MCS Tools).

**Data Links** represent special components that inject data coming from external systems.

#### Data types

Yamcs supports the following high-level data types:

* A **parameter** is a data value corresponding to the observed value of a certain device. Parameters have different properties like Raw Value, Engineering Value, Monitoring status and Validity status. Currently the raw and engineering values must be of scalar types (i.e int, float, string, etc), however in the future arrays and aggregated parameters (analogous to structs in C programming language) will be supported.
* A **processed parameter** (abbreviated PP) is a particular type of parameter that is processed by an external (to Yamcs) entity. Yamcs does not contain information about how they are processed. The processed parameters have to be converted into Yamcs internal format (and therefore compatible with the Yamcs parameter types) in order to be propagated to the monitoring clients.
* A **telemetry packet** is a binary chunk of data containing a number of parameters in raw format. The packets are split into parameters according to the definitions contained in the Mission Database.
* **(Tele)commands** are used to control remote devices and are composed of a name and a list of arguments. The commands are transformed into binary packets according to the definition in the Mission Database.
* An **event** is a data type containing a source, type, level and message used by the payload to log certain kind of events. Yamcs generates internally a number of events. In order to extract events from telemetry, a special component called *Event Decoder* has to be written.

The high-level data types described above are modelled internally on a data structure called *tuple*. A tuple is a list of (name, value) pairs, where the names are simple strings and the values being of a few predefined basic data types. The exact definition of the Yamcs high-level data types in terms of tuple (e.g. a telemetry packet has the attributes gentime(timestamp), rectime(timestamp), packet(binary), etc) is currently hard-coded inside the java sourcecode. In the future it might be externalised in configuration files to allow a certain degree of customisation.


#### Instances
The Yamcs instances provide means for one Yamcs server to monitor/control different payloads or version of the payloads at the same time. Each instance has a name, and a directory where all data from that instance is stored, as well as a specific Mission Database used to process data for that instance. Therefore, each time the Mission Database changes (e.g. due to a on-board software upgrade), a new instance has to be created. One strategy to deal with long duration missions which require multiple instances, is to put the old instances in "read only" mode by disabling the components that inject data.

#### Streams
Streams are inspired from the domain of Complex Event Processing (CEP) or Stream Processing. They are similar to database tables, but they 'contain' continuously moving data. SQL-like statements can be defined on streams for filtering, aggregation, merging or other operations. Yamcs uses the streams for distributing data between all the components running inside the same JVM.

Typically there is a stream for realtime telemetry called `tm_realtime`, one for realtime processed parameters called `pp_realtime`, one for commands called `tc`, etc.

Streams can be made 'visible' to the external word by adding HornetQ wrappers. A wrapper is a HornetQ address that is configured such that each message published to the address gets transferred to the stream and each tuple that comes via the stream is transformed into a HornetQ message and published via the address. An external client then can bind a queue to that address and receive all the messages that transit through the respective stream. Unlike the Yamcs streams which are synchronous and very light, the HornetQ addresses are asynchronous and involve more overhead.

Currently the only way to see all the streams that are running inside a Yamcs server, is using a JMX client like JConsole. JConsole can also be used to inspect the status of the HornetQ addresses.

#### Processors
Mission Control Systems like Yamcs process TM/TC according to the Mission Database definitions. Yamcs supports concurrent processing of parallel streams; one processing context is called *Processors*. Processors have clients that receive TM and send TC. Typically one Yamcs instance contains one realtime processor processing data coming in realtime and on-request replay processors, processing data from the archive. Internally, Yamcs creates a replay processor each time a parameter retrieval is requested.

#### Data Links
Data Links represent special components that communicate with the external world. There are three types of Data Links: TM (called TM Providers), TC (called TC Uplinkers) and PP (called PP Providers). TM and PP receive telemetry packets or parameters and inject them into the realtime or dump TM or PP streams. The TC data links subscribe to the realtime TC stream and send data to the external systems. Note that any stream (like the realtime TM stream) can be linked to a HornetQ address, making it possible to inject data externally. However, the Data Links can report on their status and can also be controlled by an operator to connect/disconnect to/from the data sources.
