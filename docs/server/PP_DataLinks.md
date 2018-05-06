---
layout: default
permalink: /docs/server/PP_DataLinks/
sidebar: yes
---

PP Data Links are components that collect processed parameters (PP) from external sources and inject them into a Yamcs stream. They are defined in the instance configuration file as part of the <tt>ppDataLinks</tt> list.

Each PP data link is defined in terms of an identifying name, a class (the java class instantiated by Yamcs to load the provider), a specification (used as an argument when instantiating the class) and the name of the stream where the data will be injected. There is also a property <tt>enabledAtStartup</tt> which allows to enable (default) or disable the PP provider for connecting to the external data source at the server start-up.

### SimulationPpProvider
Some tests require PP data to be simulated. This can be achieved by using the SimulationPpProvider. The SimulationPpProvider takes as input scenarios that are defined in XML files.

The XML scenario file allows to describe the parameters sent, their generation time, reception time, engineering value and monitoring value. Parameters are organized in a sequence that can be repeated to allow more complex scenarios. The speed of the simulation can be defined by setting the duration of a simulation step.

