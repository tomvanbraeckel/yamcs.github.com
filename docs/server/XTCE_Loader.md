---
layout: default
permalink: /docs/server/XTCE_Loader/
sidebar: yes
---

This loader reads an MDB saved in XML format compliant with the XTCE specification. For more information about XTCE, see [http://www.xtce.org](http://www.xtce.org).

The loader is configured in <tt>etc/mdb.yaml</tt> or in the instance configuration by specifying the 'type' as <tt>xtce</tt>, and providing the location of the XML file in the <tt>spec</tt> attribute.

## General

Yamcs uses XTCE data structures internally as much as possible, following the XTCE v1.2. Since the version 1.2 of XTCE is not yet (as of June-2018) available, the implementation has been based on various drafts found on the Internet, notably on the [xtcetools](https://gitlab.com/dovereem/xtcetools) project (whose author is one of the main contributors to the standard).
However not all parts of the standard are supported. This chapter presents an overview of the not supported features and details when the implementation might differ from the standard. All the features that are not mentioned in this chapter should be supported; if you encounter a problem please submit an [issue](https://github.com/yamcs/yamcs/issues/new).

Note that when reading the XML XTCE file Yamcs is on purpose tolerant, it ignores the tags it does not know and it also strives to be backward compatibible with XTCE 1.0 and 1.1. Thus the fact that an XML file loads in Yamcs does not mean that is 100% valid. Please use a generic XML validation tool or the xtcetools project mentioned above to validate your XML file.


The following concepts are <b>not supported</b> at all:
* <tt>Stream</tt> - data is assumed to be injected into Yamcs as packets (see [Data Links](/docs/server/Data_Link_Initialiser/)), any stream processing has to be done as part of the data link definition and is not based on XTCE. 
* <tt>Message</tt>
* <tt>ParameterSegmentRefEntry</tt>
* <tt>ContainerSegmentRefEntry</tt>
* <tt>BooleanExpression</tt>
* <tt>DiscreteLookupList</tt>
* <tt>ErrorDetectCorrectType</tt>. Note that error detection/correction is implemented directly into the Yamcs data links.
* <tt>ContextSignificanceList</tt>
* <tt>ParameterToSetList</tt>
* <tt>ParameterToSuspendAlarmsOnSet</tt>
* <tt>RestrictionCriteria/NextContainer</tt>
* <tt>CommandVerifierType/(Comparison, BooleanExpression,ComparisonList)</tt> - soon to be implemented
* <tt>CommandVerifierType/ParameterValueChange</tt> - soon to be implemented

The other elements are supported one way or another, exceptions or changes from the specs are given in the sections below.


### Header
Only the version and date are supported. <tt>AuthorSet</tt> and <tt>NoteSet</tt> are ignored.


### Data Encodings

### changeThreshold
changeThreshold is not supported.


#### FromBinaryTransformAlgorithm
In XTCE the <tt>FromBinaryTransformAlgorithm</tt> can be specified for the <tt>BinaryDataEncoding</tt>. It is not clear how exactly that is supposed to work. In Yamcs the <tt>FromBinaryTransformAlgorithm</tt> can be specified on any <tt>XyzDataEncoding</tt> and is used to convert from binary to the raw value which is supposed to be of type Xyz.

#### ToBinaryTransformAlgorithm
not supported for any data encoding

#### FloatDataEncoding
Yamcs supports IEEE754_1985, MILSTD_1750A and STRING encoding. STRING is not part of XTCE - if used, a StringDataEncoding can be attached to the FloatDataEncoding and the string will be extracted according to the StringDataEncoding and then parsed into a float or double according to the sizeInBits of FloatDataEncoding. DEC, IBM and TI encoding are not supported.

#### StringDataEncoding
For variable size strings whose size is encoded in front of the string, Yamcs allows to specify only for command arguments sizeInBitsOfSizeTag = 0. This means that the value of the argument will be inserted without providing the information about its size. The receiver has to know how to derive the size. This has been implemented for compatibility with other sysstems (e.g. SCOS-2k) which allows this - however it is not allowed by XTCE which enforces sizeInBitsOfSizeTag > 0. 

### Data Types

#### ValidRange
Not supported for any parameter type.

#### BooleanDataType
In XTCE, each <tt>BooleanDataType</tt> has a string representation. In Yamcs the value is mapped to a org.yacms.parameter.BooleanValue or the protobuf equivalnet that is a wrapper for a boolean (either true or false in all sane programming languages). The string value is neverhteless supported in comparisons and mathalgorithms but they are converted internally to the boolean value. If you want to get to the string representation from the client, use an <tt>EnumeratedParameterType</tt>.


#### RelativeTimeDataType
not supported.


## Monitoring

### ParameterSetType
<tt>parameterRef</tt> is not supported. According to XTCE doc this is "Used to include a Parameter defined in another sub-system in this sub-system". It is not clear what it means "to include". Parameters from other space systems can be referenced using a fully qualified name or a relative name.

### ParameterProperties
* <tt>PhysicalAddressSet</tt> is not supported.
* <tt>SystemName</tt> is not supported.
* <tt>TimeAssociation</tt> is not supported.


### Containers
<tt>BinaryEncoding</tt> not supported in the container definitions.


### StringParameterType
Alarms are not supported.

## Commanding

Aggregates and Arrays are not supported for commands (they are for telemetry).

### ArgumentRefEntry
* <tt>IncludeCondition</tt> is not supported
* <tt>RepeatEntry</tt> is not supported
