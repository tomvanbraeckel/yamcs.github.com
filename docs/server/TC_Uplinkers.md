---
layout: default
permalink: /docs/server/TC_Uplinkers/
sidebar: yes
---

### DassTcUplinker
Sends telecommands to the DaSS. It supports decoding of acknowledgments from DaSS, MCS, FSC, FRC, A, B, and C and upon reception of any of them, it generates two command history entries:

<table class="inline">
    <tr>
        <th><code>&lt;source&gt;_Status</code></th>
        <td>"OK" or "NACK msg"</td>
    </tr>
    <tr>
        <th><code>&lt;source&gt;_Time</code></th>
        <td>the time at the reception of the acknowledgment</td>
    </tr>
</table>

Where `<source>` is one of:

* Acknowledge_DaSS
* Acknowledge_MCS
* Acknowledge_FSC
* Acknowledge_FRC
* Acknowledge_A
* Acknowledge_B
* Acknowledge_C

The uplinker also supports resequencing events which is a process through which one upstream commanding server can change the sequence count of the uplinked telecommand, in order to preserve the correct sequence across multiple commanding clients.

### TcpTcUplinker
Sends telecommands via TCP. Can be connected directly to the Columbus Emulator. It emulates all the DaSS related acknowledgments presented in the section above, with ACK OK.

### TcapTcUplinker
Sends telecommands to the TCAP process which is a part of PaCTS.

<div class="hint">
    TCAP is doing its own CCSDS APID sequence counting and the protocol does not foresee a way to pass this information back to the TcapTcUplinker. Thus TcapTcUplinker will have no idea on what the final sequence count will be and will not generate corresponding re-sequencing command history events. Thus the Command History will not be able to associate the corresponding CCSDS command response (sent by the BSW) to the telecommand sent.
</div>
