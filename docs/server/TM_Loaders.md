---
layout: default
permalink: /docs/server/TM_Loaders/
sidebar: yes
---

#### CD-MCS MDB

This loader loads the telemetry definition directly from the Oracle using the oracle jdbc driver. The relevant configuration file is `etc/cdmcs-mdb.yaml`. 

This configuration file contains, next to the username/password used to connect to the database, the path and the version of the CCU that will be loaded and also the testConfiguration (an end item of type EGSE_TEST_CONFIGURATION).

Based on the CCU parameters and on the opsname of the testConfiguration<footnote><para>Note that the test configuration can only be specified through its opsname, so the opsname must exist and be unique.</para></footnote>, Yamcs can determine the following three attributes which are used as attributes of the XTCE header:

* CCU Internal Version - this is a number uniquely identifying the CCU and the CCU version
* Test Configuration SID - this is a number uniquely identifying the test configuration
* Consistency Date - this is the time when the configured CCU has been last modified.

Please refer to <xref linkend="telemetry-processing"/> and to <xref linkend="commanding"/> for details on the loading of the MDB end items and on the mapping to Yamcs structures.

The configuration parameter `checkForUpdatedMdb` configures Yamcs to check or not the Oracle database for modified versions of the MDB. If the MDB can not be loaded from the serialized file, the Oracle database is checked nevertheless.

This option is useful for working offline. However if it is set to false, Yamcs will never read new versions of the database, and if the database is modified and SCOE files generated, MCS Tools will refuse to load the SCOE files (it will want old ones corresponding to the saved Yamcs database).

The packet description in CD-MCS MDB is spread over different structures. When read into Yamcs, they are converted into the XTCE structures as follows:

1. A generic sequence container named "ccsds" is created. This will be the root of the hierarchy. Three parameters are added to this sequence container:

    * CCSDS_APID - the APID in the CCSDS primary header.
    * CCSDS_SH_PACKETTYPE - the packet type in the CCSDS secondary header.
    * CCSDS_PACKETID - the packet type in the CCSDS secondary header.
    <br>

1. A generic sequence container named "CCSDS_RESPONSE_PACKET" inheriting from the "CCSDS" container is created. The inheritance condition is "CCSDS_SH_PACKETTYPE=12(Response_packet)". This packet can be used by the CIS clients which want to subscribe to all the CCSDS response packets (for example the cmd-history).

1. All the command responses (CCSDS_ADU_DESCRIPTION which have CCSDS Secondary Header set to CCSDS_RESPONSE_PACKET) are set to inherit the CCSDS_RESPONSE_PACKET container defined above. The inheritance condition is set on the CCSDS_APID, CCSDS_PACKETID parameters.

1. All others CCSDS_ADU_DESCRIPTION are set to inherit directly the root container CCSDS. The inheritance condition is set also on the CCSDS_APID and CCSDS_PACKETID parameters.

1. For each CCSDS_ADU_DESCRIPTION that contains a "Reference To a Structure ID or Table" pointing to an end item of type MEASUREMENT_LIST_TABLE, an additional integer parameter is created containing the definition of the "Flexible ID" as defined in this aggregate. Then for each end item of type PUS_STRUCTURE_ID referred in the MEASUREMENT_LIST_TABLE, a sequence container is created in Yamcs, set to inherit the original CCSDS_ADU_DESCRIPTION with the inheritance condition on the Flexible ID as defined in the MEASUREMENT_LIST_TABLE.

![Creation of the sequence containers from the CD-MCS MDB](/assets/server/MDBSequenceContainerCreation.png){: .center-image }

#### Excel Spreadsheet
This loader constructs the MDB using containers and parameters defined in one or more Excel spreadsheets.

The loader is configured in `etc/mdb.yaml` (see <xref linkend="mdb.yaml"></xref> for a sample configuration). Specify the 'type' as `sheet`, and provide the location of the spreadsheet file in the spec attribute. Additional spreadsheets may be specified in a `subLoaders` list, using the type and spec attributes for each additional spreadsheet.

The format of the Excel spreadsheet is described in <xref linkend="excel-spec"></xref>.

#### XTCE files
This loader reads an MDB saved in XML format compliant with the XTCE specification <xref linkend="RD3"></xref>. For more information about XTCE, see <xref linkend="RD2"></xref>.</para>

The loader is configured in `etc/mdb.yaml` (see <xref linkend="mdb.yaml"></xref> for a sample configuration). Specify the 'type' as `xtce`, and provide the location of the XML file in the spec attribute.
