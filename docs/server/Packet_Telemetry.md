---
layout: default
permalink: /docs/server/Packet_Telemetry/
sidebar: yes
---

The Yamcs Server implements a subset of the XTCE (XML Telemetric and Command Exchange) for telemetry processing. Only the concepts defined by the standard are supported.

For information about XTCE, please refer to [http://www.xtce.org](http://www.xtce.org). These sections detail only the XTCE types implemented in Yamcs.

#### Sequence Containers

Sequence containers are the equivalent of packets in the usual terminology, or ADU in the MDB terminology.

A sequence container employs two mechanism to avoid the limitation of traditional "packet with parameters" approach. These mechanisms are *aggregation* and *inheritance*.

#### Container aggregation
A sequence container contains *sequence entries* which can be of two types:

* Parameter Entries - these point to normal parameters.
* Container Entries - these point to other containers which are then included in the big container.

Special attention must be given to the specification of positions of entries in the container. For performance reasons, it is preferable that all positions are absolute (i.e. relative to the beginning of the container) rather than relative to the previous entry. The Excel spreadsheet loader tries to transform the relative positions specified in the spreadsheet into absolute positions.

However, due to entries which can be of variable size, the situation cannot always be avoided. When an entry whose position is relative to the previous entry is subscribed, Yamcs adds to the subscription all the previous entries until it finds one whose position is absolute.

If an entry's position depends on another entry (it can be the same in case the entry repeats itself) which is a Container Entry (i.e. makes reference to a container), and the referenced container doesn't have the size in bits specified, then all the entries of the referenced container plus all the inheriting containers and their entries recursively are added to the subscription. Thus, the processing of this entry will imply the extraction of all parameters from the referenced container and from the inheriting containers. The maximum position reached when extracting entries from the referenced and inheriting containers is considered the end of this entry and used as the beginning of the following one.

#### Container inheritance

Sequence containers can point to another sequence container through the baseContainer property, meaning that the baseContainer is extended with additional sequence entries. The inheritance is based on a condition put on the parameters from the baseContainer (e.g. a EDR_HK packet is a CCSDS packet which has the apid=943 and the packetid=0x1300abcd).	
        
#### Little Endian Parameter Encoding
Yamcs does not currently support the XTCE way of describing byte ordering for parameter encoding.

The only alternative byte order supported is little endian. For parameters occupying entire bytes, there is no doubt on what this means. However, for parameters which occupy only part of bytes the following algorithm is applied to extract the parameter from the packet:

1. Based on the location of the first bit and on the size in bits of the parameter, find the sequence of bytes that contains the parameter. Only parameters that occupy at most 4 bytes are supported.

1. Read the bytes in reverse order in a 4 bytes int variable.

1. Apply the mask and the shift required to bring the parameter to the rightmost bit.

For example, assuming that on an x86 CPU we have the following structure in C:

```c
struct {
    unsigned int parameter1:4;
    unsigned int parameter2:16;
    unsigned int parameter3:12;
} x;
x.a=0x1;
x.b=0x2345;
x.c=0x678;
```

Would result, when converted to network order, in the sequence of hex bytes  `51 34 82 67`. Thus, the definition of this packet should look like:

<table class="inline">
    <tr>
        <th>Parameter</th>
        <th width="25%">Location</th>
        <th width="25%">Size</th>
    </tr>
    <tr>
        <td>parameter1</td>
        <td>4</td>
        <td>4</td>
    </tr>
    <tr>
        <td>parameter2</td>
        <td>4</td>
        <td>16</td>
    </tr>
    <tr>
        <td>parameter3</td>
        <td>16</td>
        <td>12</td>
    </tr>
</table>
