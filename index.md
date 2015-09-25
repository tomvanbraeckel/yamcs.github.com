---
layout: home
sidebar: no
---

In mission control centers, a major part of the ground segment is the front-end and back-end software which is used to assist payload and system operators in their daily tasks. Yamcs (short for *Yet another mission control system*) is a software package that positions itself as a lightweight alternative to traditional heavyweight Mission Control Systems.

Yamcs is a cost-efficient suite of tools for spacecraft, payload and ground segment operations preparation, execution and spacecraft AIT.

### Typical Deployment

A typical deployment of Yamcs consists of **Yamcs Server** connecting to a TM/TC frontend or to a simulator. The TM/TC frontend is the interface to the payload. It can be either a ground station during the operations or some EGSE equipment during the development. Or it could be a simulator used for development and test of the ground software or for training purposes.

![Typical Deployment](/assets/typical-deployment.png){: .center-image }

The data acquired from the TM/TC frontend is interpreted based on the Mission Database. The Mission Database can be as simple as an excel spreadsheet or can be a engineering database used when developing the payload/spacecraft.

Connected to Yamcs are a number of workstations which run end-user applications such as displays or commanding tools. Together with the end-user applications, there can be other mission specific applications connected to Yamcs for performing mission planning, science data processing and various other tasks.

Yamcs offers a web friendly REST interface which can be used to integrate data from Yamcs into web applications or to retrieve data remotely from Internet. As security is usually a concern, a second Yamcs server can be deployed in a DMZ network and selected data mirrored there for Internet access.

Yamcs uses an embedded key-value database for storing all the received TM and sent TC. This helps to keep the deployment dependencies at a minimum. There are however plans for implementing support for distributed "big data" databases such as Apache HBase.

For development purposes, all the software can run on a developer computer or laptop.

### Further Features
* Acquisition of telemetry and dispatching of commands using different protocols:
    * Raw packets over UDP unicast or multicast
    * Raw packets over TCP
    * HornetQ relaying from another Yamcs server
    * Various other project specific protocols like DaSS (Columbus Ground Segment specific protocol), PaCTS (EGSE software used by some of the Columbus payloads)
* Custom protocols can be easily added
* Comfortable packet structure definition, partially implementing the [XTCE standard](http://www.xtce.org)
* Compatible with the Unified Synoptic System (USS)
* Telemetry replay, scientific data extraction, profiling, and offline analysis
* Detailed packet and parameter inspection
* Remote and cascaded connectivity from external science users or other centers
* Username/password or SSL (certificate) based authentication. All the authentication data is stored in an LDAP database
* Authorization at parameter, packet, and command level. Also the authorization data is stored in an LDAP database


For more information on the Yamcs suite of tools, head over to the [Yamcs Docs](/docs/). For a quick test-run of core functionality, have a look at [Up & Running](/running/).
