---
layout: default
version: 0.28.0
permalink: /docs/server/0.28.0/TM_Loaders/
sidebar: yes
---


#### Excel Spreadsheet
This loader constructs the MDB using containers and parameters defined in one or more Yamcs [Excel spreadsheets](/docs/server/Excel_Specification/).

The loader is configured in [etc/mdb.yaml](/docs/server/mdb.yaml/). Specify the 'type' as <tt>sheet</tt>, and provide the location of the spreadsheet file in the spec attribute. Additional spreadsheets may be specified in a <tt>subLoaders</tt> list, using the type and spec attributes for each additional spreadsheet.

#### XTCE files
This loader reads an MDB saved in XML format compliant with the XTCE specification. For more information about XTCE, see [http://www.xtce.org](http://www.xtce.org).

The loader is configured in [etc/mdb.yaml](/docs/server/mdb.yaml/). Specify the 'type' as <tt>xtce</tt>, and provide the location of the XML file in the <tt>spec</tt> attribute.

#### CD-MCS MDB

This loader loads the telemetry definition directly from the Oracle using the oracle jdbc driver. The relevant configuration file is <tt>etc/cdmcs-mdb.yaml</tt>. 

This configuration file contains, next to the username/password used to connect to the database, the path and the version of the CCU that will be loaded and also the testConfiguration (an end item of type <tt>EGSE_TEST_CONFIGURATION</tt>).

Based on the CCU parameters and on the opsname of the testConfiguration (the test configuration can only be specified through its opsname, so the opsname must exist and be unique.), Yamcs can determine the following three attributes which are used as attributes of the XTCE header:

* CCU Internal Version - this is a number uniquely identifying the CCU and the CCU version
* Test Configuration SID - this is a number uniquely identifying the test configuration
* Consistency Date - this is the time when the configured CCU has been last modified.

Please refer to [Telemetry Processing](/docs/server/Telemetry_Processing/) and to [Commanding](/docs/server/Commanding) for details on the loading of the MDB end items and on the mapping to Yamcs structures.

The configuration parameter <tt>checkForUpdatedMdb</tt> configures Yamcs to check or not the Oracle database for modified versions of the MDB. If the MDB cannot be loaded from the serialized file, the Oracle database is checked nevertheless.

This option is useful for working offline. However if it is set to false, Yamcs will never read new versions of the database, and if the database is modified and SCOE files generated, MCS Tools will refuse to load the SCOE files (it will want old ones corresponding to the saved Yamcs database).

The packet description in CD-MCS MDB is spread over different structures. When read into Yamcs, they are converted into the XTCE structures as follows:

1. A generic sequence container named "ccsds" is created. This will be the root of the hierarchy. Three parameters are added to this sequence container:

    <table class="inline">
        <tr>
            <th class="code">CCSDS_APID</th>
            <td>the APID in the CCSDS primary header</td>
        </tr>
        <tr>
            <th class="code">CCSDS_SH_PACKETTYPE</th>
            <td>the packet type in the CCSDS secondary header</td>
        </tr>
        <tr>
            <th class="code">CCSDS_PACKETID</th>
            <td>the packet type in the CCSDS secondary header</td>
        </tr>
    </table>

1. A generic sequence container named <tt>CCSDS_RESPONSE_PACKET</tt> inheriting from the "CCSDS" container is created. The inheritance condition is <tt>CCSDS_SH_PACKETTYPE=12(Response_packet)</tt>. This packet can be used by the CIS clients which want to subscribe to all the CCSDS response packets (for example the cmd-history).

1. All the command responses (<tt>CCSDS_ADU_DESCRIPTION</tt> which have CCSDS Secondary Header set to <tt>CCSDS_RESPONSE_PACKET</tt>) are set to inherit the <tt>CCSDS_RESPONSE_PACKET</tt> container defined above. The inheritance condition is set on the <tt>CCSDS_APID</tt>, <tt>CCSDS_PACKETID</tt> parameters.

1. All others <tt>CCSDS_ADU_DESCRIPTION</tt> are set to inherit directly the root container CCSDS. The inheritance condition is set also on the <tt>CCSDS_APID</tt> and <tt>CCSDS_PACKETID</tt> parameters.

1. For each <tt>CCSDS_ADU_DESCRIPTION</tt> that contains a "Reference To a Structure ID or Table" pointing to an end item of type <tt>MEASUREMENT_LIST_TABLE</tt>, an additional integer parameter is created containing the definition of the "Flexible ID" as defined in this aggregate. Then for each end item of type <tt>PUS_STRUCTURE_ID</tt> referred in the <tt>MEASUREMENT_LIST_TABLE</tt>, a sequence container is created in Yamcs, set to inherit the original <tt>CCSDS_ADU_DESCRIPTION</tt> with the inheritance condition on the Flexible ID as defined in the <tt>MEASUREMENT_LIST_TABLE</tt>.

![Creation of the sequence containers from the CD-MCS MDB](/assets/server/MDBSequenceContainerCreation.png){: .center-image }

