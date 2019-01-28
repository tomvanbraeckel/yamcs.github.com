---
layout: default
permalink: /docs/server/Spreadsheet_Loader/
sidebar: yes
chapter: yes
---

The spreadsheet loader loads mission database definitions from excel spreadsheet. Only excel prior to Excel 2007 are supported (.xls files not .xlsx).

* TOC
{:toc}

### Multiple Space Systems support
Since version 5.4, the spreadsheet definition supports loading from one Excel file a hierarchy composed of multiple space systems. Until version 5.3 this was only possible by defining multiple Excel files (one per subsystem) and defining the hierarchy in <tt>etc/mdb.yaml</tt>. Also until version 5.3 the loader forced some sheets to always be present (e.g. Containers). From version 5.4 only the General sheet has to be present, all the other ones are optional. 

To define the space system hierarchy, the convention is that all the sheets that do not have a prefix contain data for the main space system whose name is defined in the General sheet.
To define data in subsystems, a syntax like  <tt>SYSTEM1|SYSTEM2|Containers</tt> can be used. This definition will create a SYSTEM1 as part of the main space system and a child SYSTEM2 of SYSTEM1. Then the containers will be loaded in SYSTEM2.

The spreadsheet loader scans and creates the subsystem hierarchy and then it loads the data inside the systems traversing the hierarchy in a depht-first order.


### Conventions

* All numeric values can be entered as decimals or as hexadecimals (with prefix <tt>0x</tt>)
* Although column names are used for reference below, columns must not be reordered

A number of mandatory named sheets are described as part of this specification, though authors may add their own sheets and still use the spreadsheet file as the reference MDB.

### Rules for parameter/conainer reference lookup

Each time a name reference is mentioned in the spreadsheet, the following rules apply:
<ul>
  <li>The reference can use UNIX like directory access expressions (../a/b).</li>
  <li>If the name is not found as a qualified parameter, and the option enableAliasReferences is configured for the SpreadsheetLoader, the parameter is looked up through all the aliases of the parent systems.</li>
</ul>
The exact result of the lookup depends of course on the exact tree configuration in mdb.yaml"


### General Sheet
This sheet must be named "General", and the columns described must not be reordered.

<table class="inline">
	<tr>
		<th>format version</th>
		<td>Used by the loader to ensure a compatible spreadsheet structure</td>
	</tr>
	<tr>
		<th>name</th>
		<td>Name of the MDB</td>
	</tr>
	<tr>
		<th>document version</th>
		<td>Used by the author to track versions in an arbitrary manner</td>
	</tr>	
</table>

### Containers Sheet
This sheet must be named "Containers", and the columns described must not be reordered. The sheet contains description of the content of the container (packet). 
As per XTCE, a container is a structure describing a binary chunk of data composed of multiple entries.

A container can inherit from other container - meaning that it takes all entries from the parent and it adds some more. It can have two types of entries:
- parameters
- other containers (this is called aggregation)

General conventions:

* first line with a new 'container name' starts a new packet
* second line after a new 'container name' should contain the first measurement
* empty lines are only allowed between two packets

Comment lines starting with “#” on the first column can appear everywhere and are ignored.

<table class="inline">
	<tr>
		<th>container name</th>
		<td>The relative name of the packet inside the space system</td>
	</tr>
	<tr>
		<th>parent</th>
		<td>Parent container and position in bits where the subcontainer starts, for example  <tt>PARENT_CONTAINER:64</tt>. If position in bits is not specified, the default position is to start from the last parameter in the parent. If parent is not specified, either the container is the root, or it can be used as part of another container in aggregation.</td>
	</tr>
	<tr>
		<th>condition</th>
		<td>Inheritance condition, usually specifies a switch within the parent which activates this child, for example `MID=0x101` There are currently three forms supported:
                 <ul> 
                      <li>Simple condition:  <tt>Parameter==value</tt></li>
                      <li>Condition list:  <tt>Parameter==value;Parameter2==value2</tt> - all conditions must be true</li>
                      <li>Boolean condition: <tt>op(epx1;exp2;...;expn)</tt>
                          <ul>
                            <li>op is '&' (AND) or '|' (OR)</li>
                            <li>expi is a boolean expression or a simple condition</li>
                          </ul>
                      </li>
                  </ul>
                Currently the only supported conditions are on the parameters of the parent container. This cover the usual case where the parent defines a header and the inheritance condition
                is based on paraemters from the header.
               </td>
	</tr>
	
</table>

### Parameters Sheet
This sheet must be named ending with "Parameters", and the columns described must not be reordered. The sheet contains parameter (sometimes called measurements) information.
Any number of sheets ending with "Parameters" can be present and they all have the same structure. Each parameter has a so called "DataSource" (as per XTCE) which is not immediately configured.
However by historical convention:
  <ul>
    <li>DerivedParameters contains all parameter whose data source is set to "DERIVED" - these are usually results of algorithm computations.</li>
    <li>LocalParameters contains all parameters whose data source is set to "LOCAL" - these are parameters that can be set by the user using the Yamcs API </li>
    <li>All other parameter sheets contain parameters whose data source is set to "TELEMETERED" - these are parameters received from remote devices </li>
 </ul>


A parameter when extracted from a binary packet has two forms: a raw value and an engineering value. The extraction from the raw packet is performed according to the encoding, whereas the conversion 
from raw to engineering value is performed by a calibrator. This sheet can also be used to specify parameters without encoding - if they are received already extracted, Yamcs can do only their calibration. 
Or it can be that a parameter is already calibrated, it can still be specified here to be able to associate alarms.

Empty lines can appear everywhere and are ignored.
Comment lines starting with “#” on the first column can appear everywhere and are ignored.

<table class="inline">
	<tr>
		<th>name</th>
		<td>The name of the parameter in the namespace.</td>
	</tr>
	<tr>
		<th>encoding</th>
		<td>Description on how to extract the raw type from the binary packet. See <a href="#encoding-and-raw-types"> below</a> for all supported encodings.</td>
	</tr>
	<tr>
		<th>raw type</th>
		<td>See <a href="#encoding-and-raw-types"> below</a> for all supported raw types</td>
	</tr>
	<tr>
		<th>eng type</th>
		<td>See <a href="#engineering-types">Engineering Types</a></td>
	</tr>
	<tr>
		<th>eng unit</th>
		<td>Free-form textual description of unit(s). E.g. degC, W, V, A, s, us</td>
	</tr>
	<tr>
		<th>calibration</th>
		<td>Name of a calibration described in the Calibration sheet, leave empty if no calibration is applied</td>
	</tr>
	<tr>
		<th>description</th>
		<td>Optional human-readable text</td>
	</tr>
	<tr>
                <th>namespace:&lt;NS-NAME&gt;</th>
                <td>If present, these columns can be used to assign additional names to the parameters in the namespace NS-NAME. Any number of columns can be present to give additional names in different namespaces.</td>
        </tr>
</table>

#### Encoding and Raw Types
Raw types describe how the parameter is encoded in the raw packet. All types are case-insensitive.

<table class="inline">
	<tr>
		<th>Raw Type</th>
		<th>Encoding</th>
		<th>Description</th>
	</tr>
	<tr>
		<td class="code" rowspan="2">uint</td>
		<td class="code">unsigned(&lt;n&gt,&lt;BE|LE&gt;)</td>
		<td>Unsigned integer.
		    <ul>
		       <li>n is size in bits.</li>
		       <li>LE = little endian, BE = big endian.</li>
		    </ul>
		</td>
	</tr>
	<tr>
	       <td class="code">&lt;n&gt;</td>
	       <td> shortcut for <tt>unsigned(&lt;n&gt;,BE)</tt></td>
	</tr>
	
	<tr>
                <td class="code" rowspan="3">int</td>
                <td class="code">twosComplement(&lt;n&gt;, &lt;BE|LE&gt;)</td>
                <td>two's complement encoding
                  <ul>
                       <li>n is size in bits.</li>
                       <li>LE = little endian, BE = big endian.</li>
                    </ul>
                </td>
        </tr>
        <tr>                
                <td class="code">signMagnitude(&lt;n&gt;, &lt;BE|LE&gt;)</td>
                <td>sign magnitude encoding - first (or last for LE) bit is the sign, the remaining bits represent the magnitude (absolute value).
                     <ul>
                       <li>n is size in bits.</li>
                       <li>LE = little endian, BE = big endian.</li>
                    </ul>
                </td>
        </tr>
	<tr>                
                <td class="code">&lt;n&gt;</td>
                <td>shortcut for <tt>twosComplement(&lt;n&gt;,BE)</tt>
                </td>
        </tr>
        
	<tr>
		<td class="code" rowspan="2">float</td>
		<td class="code">ieee754_1985(&lt;n&gt;, &lt;BE|LE&gt;)</td>
		<td>IEE754_1985 encoding
		      <ul>
                       <li>n is size in bits.</li>
                       <li>LE = little endian, BE = big endian.</li>
                    </ul>
                </td>
	</tr>
	<tr>
		<td class="code">&lt;n&gt;</td>
		<td>shortcut for <tt>iee754_1985(&lt;n&gt;,BE)</tt></td>
	</tr>
	<tr>
		<td class="code">boolean</td>
		<td>&lt;empty&gt;</td>
		<td>the encoding has to be empty - 1 bit is assumed.</td>
	</tr>
	<tr>
		<td class="code" rowspan="3">string</td>
		<td class="code">fixed(&lt;n&gt;, &lt;charset&gt;)</td>
		<td>fixed size string
		  <ul>
		    <li> <tt>n</tt> is the size in bits of the string. Only multiple of 8 supported.</li>
                    <li><tt>charset</tt> is one of the <a href="https://docs.oracle.com/javase/8/docs/api/java/nio/charset/Charset.html">charsets supported by java</a> (UTF-8, ISO-8859-1, etc).<br>    
                    If not specified, it is by default UTF-8</li>
                </ul>
                The string has to start at a byte boundary inside the container.
                </td>
                
	</tr>
	<tr>
		<td class="code">PrependedSize(&lt;x&gt;, &lt;charset&gt;)</td>
		<td>The size of string <b>in bytes</b> is specified in first <tt>x</tt> bits of string - the size itself will not be part of the string.<br>
		  <ul>
		    <li><tt>x</tt> is the size in bits of the size tag</li>
                    <li><tt>charset</tt> is as defined above.<br></li>
                  </ul>
                  Note that while x can be any number of bits<=32, the string has to start at a byte boundary.
                </td>
	</tr>
	<tr>
		<td class="code">terminated(&lt;0xBB&gt;, &lt;charset&gt;)</td>
		<td>terminated string - pay attention to the parameters following this one; if the terminator is not found all the buffer will be consumed;
		   <ul>
		     <li><tt>0xBB</tt> specifies a byte that is the string terminator</li>
                     <li><tt>charset</tt> is as defined above.</li>
                   </ul>
	       </td>
	</tr>
	<tr>
	        <td class="code" rowspan="3">binary</td>
		<td class="code">fixed(&lt;n&gt;)</td>
		<td>fixed size byte array.
		<ul>
		  <li><tt>n</tt> size of the array in bits. It has to be multiple of 8 and the parameter has to start at a byte boundary.</li>
		</ul>  
	       </td>
	</tr>
	<tr>                
                <td class="code">PrependedSize(&lt;x&gt;)</td>
                <td>byte array whose size in bytes is specified in the first <tt>x</tt> bits of the array - the size itself will not be part of the raw value.
                  <ul>
                    <li><tt>x</tt> is the size in bits of the size tag</li>                   
                  </ul>
                    Note that while x can be any number of bits<=32, the byte array has to start at a byte boundary.
                </td>
        </tr>
        <tr>                
                <td class="code">&lt;n&gt;</td>
                <td>shortcut for fixed(&lt;n&gt;)
                </td>
        </tr>
        <tr>    
                <td>&lt;any of the above&gt;</td>
                <td class="code">custom(&lt;n&gt;,algorithm)</td>
                <td>The decoding will be performed by a user defined algorithm.
                   <ul>
                     <li> &lt;n&gt; is optional and may be used to specify the size in bits of the entry in the container (in case the size is fixed) - it will use for optimizing 
                   the access to the parameters following this one.</li>
                     <li><tt>algorithm</tt> the name of the algorithm - it has to be defined in the <a href="#algorithms-sheet">algorithm sheet</a></li>
                   </ul>
                </td>
        </tr>
</table>
    
#### Engineering Types
Engineering types describe a parameter in its processed form (i.e. after any calibrations). All types are case-insensitive.

Depending on the combination of raw and engineering type, automatic conversion is applicable. For more advanced use cases, define and refer to a Calibrator in the [Calibration Sheet](#calibration-sheet)

<table class="inline">
	<tr>
		<th>Type</th>
		<th>Description</th>
		<th>Automatic Raw Conversion</th>
	</tr>
	<tr>
		<td class="code">uint</td>
		<td>Unsigned 32 bit integer - it corresponds to <tt>int</tt> in java and <tt>uint32</tt> in protobuf</td>
		<td>From <tt>int</tt>, <tt>uint</tt> or <tt>string</tt></td>
	</tr>
	<tr>
                <td class="code">uint64</td>
                <td>Unsigned 64 bit integer - it corresponds to <tt>long</tt> in java and <tt>uint64</tt> in protobuf</td>
                <td>From <tt>int</tt>, <tt>uint</tt> or <tt>string</tt></td>
        </tr>
	<tr>
		<td class="code">int</td>
		<td>Signed 32 bit integer - it corresponds to <tt>int</tt> in java and <tt>int32</tt> in protobuf</td>
		<td>From <tt>int</tt>, <tt>uint</tt> or <tt>string</tt></td>
	</tr>
	<tr>
                <td class="code">int64</td>
                <td>Signed 64 bit integer - it corresponds to <tt>long</tt> in java and <tt>int64</tt> in protobuf</td>
                <td>From <tt>int</tt>, <tt>uint</tt> or <tt>string</tt></td>
        </tr>
	<tr>
		<td class="code">string</td>
		<td>Character string - it corresponds to <tt>String</tt> in java and <tt>string</tt> in protobuf</td>
		<td>From <tt>string</tt></td>
	</tr>
	<tr>
		<td class="code">float</td>
		<td>32 bit floating point number - it corresponds to <tt>float</tt> in java and protobuf</td>
		<td>From <tt>float</tt>, <tt>int</tt>, <tt>uint</tt> or <tt>string</tt></td>
	</tr>
	<tr>
                <td class="code">double</td>
                <td>62 bit floating point number - it corresponds to <tt>double</tt> in java and protobuf</td>
                <td>From <tt>float</tt>, <tt>int</tt>, <tt>uint</tt> or <tt>string</tt></td>
        </tr>
	<tr>
		<td class="code">enumerated</td>
		<td>
			A kind of string that can only be one out of a fixed set of predefined state values. It corrersponds to <tt>String</tt> in java and <tt>string</tt> in protobuf.
		</td>
		<td>
        	From <tt>int</tt> or <tt>uint</tt>. A Calibrator is required.
		</td>
	</tr>
	
	<tr>
		<td class="code">boolean</td>
		<td>A binary true/false value - it corresponds to 'boolean' in java and 'bool' in protobuf</td>
		<td>
			<p>From any raw type</p>
			<p>Values equal to zero, all-zero bytes or an empty string are considered <em>false</em></p>
		</td>
	</tr>
	<tr>
		<td class="code">binary</td>
		<td>Byte array - it corresponds to <tt>byte[]</tt> in java and <tt>bytes</tt> in protobuf.</td>
		<td>From <tt>bytestream</tt> only</td>
	</tr>
</table>



### Calibration Sheet
This sheet must be named "Calibration", and the columns described must not be reordered. The sheet contains calibration data including enumerations.

<table class="inline">
	<tr>
		<th>calibrator name</th>
		<td>Name of the calibration - it has to match the calibration column in the Parameter sheet.</td>
	</tr>
	<tr>
		<th>type</th>
		<td> One of the following:
			<ul>
				<li><tt>polynomial</tt> for polynomial calibration.  Note that the polynomial calibration is performed with double precision
				floating point numbers even though the input and/or output may be 32 bit. </li>
				<li><tt>spline</tt> for linear spline(pointpair) interpolation. As for the polynomial, the computation is performed with double precision numbers.</li>				
				<li><tt>enumeration</tt> for mapping enumeration states</li>
				<li><tt>java-expression</tt> for writing more complex functions</li>
			</ul>
		</td>
	</tr>
	<tr>
		<th>calib1</th>
		<td>
			<ul>
				<li>If the type is <tt>polynomial</tt>: it list the coefficients, one per row starting with the constant and up to the highest grade. There is no limit in the number of coefficients (i.e. order of polynomial).</li>
				<li>If the type is <tt>spline</tt>: start point (x from (x,y) pair)</li>
				<li>If the type is <tt>enumeration</tt>: numeric value</li>
				<li>If the type is <tt>java-expression</tt>: the textual formula to be executed (see below)</li>
			</ul>
		</td>
	</tr>
	<tr>
		<th>calib2</th>
		<td>
			<ul>
				<li>If the type is <tt>polynomial</tt>: leave <em>empty</em></li>
				<li>If the type is <tt>spline</tt>: stop point (y) corresponding to the start point(x) in <tt>calib1</tt></li>				
				<li>If the type is <tt>enumeration</tt>: text state corresponding to the numeric value in <tt>calib1</tt></li>
				<li>If the type is <tt>java-expression</tt>: leave <em>empty</em></li>
			</ul>
		</td>
	</tr>
</table>

#### Java Expressions
This is intended as a catch-all case. XTCE specifies a MathOperationCalibration calibrator that is not implemented in Yamcs. However these expressions can be used for the same purpose.
They can be used for float or integer calibrations. 

The expression appearing in the <em>calib1</em> column will be enclosed and compiled into a class like this:

```java
package org.yamcs.xtceproc.jecf;
public class Expression665372494 implements org.yamcs.xtceproc.CalibratorProc {
   public double calibrate(double rv) {
       return <expression>;
   }
}
```

The expression has usually to return a double; but java will convert implicitly any other primitive type to a double.

Java statements cannot be used but the conditional operator “? :” can be used; for example this expression would compile fine:

```java
  rv>0?rv+5:rv-5
```

Static functions can be also referenced. In addition to the usual Java ones (e.g. Math.sin, Math.log, etc) user own functions (that can be found as part of a jar on the server in the lib/ext directory) can be referenced by specifying the full class name:
```java
  my.very.complicated.calibrator.Execute(rv)
```

### Algorithms Sheet
This sheet must be named "Algorithms", and the columns described must not be reordered. The sheet contains arbitrarily complex user algorithms that can set (derived) output parameters based on any number of input parameters.

Comment lines starting with “#” on the first column can appear everywhere and are ignored.
Empty lines are used to separate algorithms and cannot be used inside the specification of one algorithm.


<table class="inline">
	<tr>
		<th>algorithm name</th>
		<td>The identifying name of the algorithm.</td>
	</tr>
	<tr>
                <th>algorithm language</th>
                <td>The programming language of the algorithm. Currently supported values are:
                   <ul>
                     <li>JavaScript</li>
                     <li>python - note that this requires the presence of jython.jar in the Yamcs lib or lib/ext directory (it is not delivered together with Yamcs).</li>
                     <li>Java</li>
                     </ul>
                </td>
        </tr>
	<tr>
		<th>text</th>
		<td>The code of the algorithm (see below for how this is interpreted).</td>
	</tr>
	<tr>
		<th>trigger</th>
		<td>
			Optionally specify when the algorithm should trigger:
			<ul>
				<li><tt>OnParameterUpdate('/some-param', 'some-other-param')</tt><br>Execute the algorithm whenever <em>any</em> of the specified parameters are updated</li>
				<li><tt>OnInputParameterUpdate</tt><br>This is the same as above for all input parameters (i.e. execute whenever <em>any</em> input parameter is updated).</li>
				<li><tt>OnPeriodicRate(&lt;fireRate&gt;)</tt><br>Execute the algorithm every <tt>fireRate</tt> milliseconds</li>
				<li><tt>none</tt><br>The algorithm doesn't trigger automatically but can be called upon from other parts of the system (like the command verifier)</li>
			</ul>
			The default is none.
		</td>
	</tr>
	
	<tr>
		<th>in/out</th>
		<td>Whether a parameter is inputted to, or outputted from the algorithm. Parameters are defined, one per line, following the line defining the algorithm name</td>
	</tr>
	<tr>
		<th>parameter reference</th>
		<td>
			<p>Reference name of a parameter. See above on how this reference is resolved.</p>
			<p>Algorithms can be interdependent, meaning that the output parameters of one algorithm could be used as input parameters of another algorithm.</p>
		</td>
	</tr>
	<tr>
		<th>instance</th>
		<td>
			<p>Allows inputting a specific instance of a parameter. At this stage, only values smaller than or equal to zero are allowed. A negative value, means going back in time. Zero is the default and means the actual value. This functionality allows for time-based window operations over multiple packets. Algorithms with windowed parameters will only trigger as soon as all of those parameters have all instances defined (i.e. when the windows are full).</p>
			<p>Note that this column should be left empty for output parameters.</p>
		</td>
	</tr>
	<tr>
		<th>name used in the algorithm</th>
		<td>
			<p>An optional friendlier name for use in the algorithm. By default the parameter name will be used, which may lead to runtime errors depending on the naming conventions of the applicable script language.</p>
			<p>Note that a unique name will be required in this column, when multiple instances of the same parameter are inputted.</p>
		</td>
	</tr>
</table>

#### JavaScript algorithms
A full function body is expected. The body will be encapsulated in a javascript function like
```javascript
function algorithm_name(in_1, in_2, ..., out_1, out_2...) {
   <algorithm-text>
}
```
The <tt>in_n</tt> and <tt>outX</tt> are to be names given in the spreadsheet column <em>name used in the algorithm</em>.

The method can make use of the input variables and assign out_x.value (this is the engineering value) or out_x.rawValue (this is the raw value) and out_x.updated for each output variable.
The <out>.updated can be set to false to indicate that the output value has not to be further processed even if the algorithm has run.
By default it is true - meaning that each time the algorithm is run, it is assumed that it updates all the output variables.

If out_x.rawValue is set and out_x.value is not, then Yamcs will run a calibration to compute the engineering value.

Note that for some algorithms (e.g. command verifiers) need to return a value (rather 

#### Python algorithms
This works very similarly with the JavaScript algorithms, The thing to pay attention is the indentation. The algorithm text wihch is specified in the spreadsheet will be automatically indeted with 4 characters.
```python
function algorithm_name(in_1, in_2, ..., out_1, out_2...) {
   <algorithm-text>
}
```

#### Java algorithms
The algorithm text  is a class name with optionally parantheses enclosed string that is parsed into an object by an yaml parser.
Yamcs will try to locate the given class who must be implementing the org.yamcs.algorithms.AlgorithmExecutor interface and will create an object with a constructor with three paramethers:
```java
<Constructor>(Algorithm, AlgorithmExecutionContext, Object arg) 
```

where <tt>arg</tt> is the argument parsed from the yaml.

If the optional argument is not present in the algorithm text definition,  then the class constructor  should only have two parameters.
The abstract class <tt>org.yamcs.algorithms.AbstractAlgorithmExecutor</tt> offers some helper methods and can be used as base class for implementation of such algorithm.

If the algorithm is used for data decoding, it has to implement the <tt>org.yamcs.xtceproc.DataDecoder</tt> interface instead (see below). 

#### Command verifier algorithms
Command verifier algorithms are special algorithms associated to the command verifiers. Multiple instances of the same algorithm may execute in parallel if there are multiple pending commands executed in parallel.

These algorithms are special as they can use as input variables not only parameters but also command arguments and command history events. These are specified by using "/yamcs/cmd/arg/" and "/yamcs/cmdHist" prefix respectively.

In addition these algorithms may return a boolean value (whereas the normal algorithms only have to write to output variables). The returned value is used to indicate if the verifier has succeeded or failed. No return value will mean that the verifier is still pending.

#### Data Decoding algorithms
The Data Decoding algorithms are used to extract a raw value from a binary buffer. 
These algorithms do not produce any output and are triggered whenever the parameter has to be extracted from a container.

These algorithms work differently from the other ones and have are some limitations:
<ul>
 <li> only Java is supported as a language</li>
 <li> not possible to specify input parameters</li>
</ul>

These algorithms have to implement the interface org.yamcs.xtceproc.DataDecoder.




#### Example Definition

<table class="inline small-contents">
	<tr>
		<th>algo name</th>
		<th>language</th>
		<th>text</th>
		<th>trigger</th>
		<th>in/out</th>
		<th>param name</th>
		<th>instance</th>
		<th>friendly<br>name</th>
	</tr>
	<tr>
		<td class="code">my_avg</td>
		<td class="code">JavaScript</td>
		<td class="code">r.value = (a.value + b.value + c.value) / 3;</td>
		<td class="code">OnInputParameterUpdate</td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
	</tr>
	<tr>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code">in</td>
		<td class="code">/MY_SS/some_temperature</td>
		<td class="code">-2</td>
		<td class="code">a</td>
	</tr>
	<tr>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code">in</td>
		<td class="code">/MY_SS/some_temperature</td>
		<td class="code">-1</td>
		<td class="code">b</td>
	</tr>
	<tr>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code">in</td>
		<td class="code">/MY_SS/some_temperature</td>
		<td class="code">0</td>
		<td class="code">c</td>
	</tr>
	<tr>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code">out</td>
		<td class="code">/MY_SS/avg_out</td>
		<td class="code"></td>
		<td class="code">r</td>
	</tr>
</table>

#### Example Definition for a command verifier algorithm

<table class="inline small-contents">
        <tr>
                <th>algo name</th>
                <th>language</th>
                <th>text</th>
                <th>trigger</th>
                <th>in/out</th>
                <th>param name</th>
                <th>instance</th>
                <th>friendly<br>name</th>
        </tr>
        <tr>
                <td class="code">alg_verif_completed</td>
                <td class="code">JavaScript</td>
                <td class="code">if((receivedCmdId.value==sentCmdId.value) && (receivedSeqNum.value==sentSeqNum.value) && (stage.value==2) ) {
    if(result.value==0) return true;
    else return false;}
                </td>
                <td class="code"></td>
                <td class="code"></td>
                <td class="code"></td>
                <td class="code"></td>
                <td class="code"></td>
        </tr>
        <tr>
                <td class="code"></td>
                <td class="code"></td>
                <td class="code"></td>
                <td class="code"></td>
                <td class="code">in</td>
                <td class="code">/yamcs/cmd/arg/packet-id</td>
                <td class="code"></td>
                <td class="code">sentCmdId</td>
        </tr>
        <tr>
                <td class="code"></td>
                <td class="code"></td>
                <td class="code"></td>
                <td class="code"></td>
                <td class="code">in</td>
                <td class="code">/yamcs/cmdHist/ccsds-seqcount</td>
                <td class="code"></td>
                <td class="code">sentSeqNum</td>
        </tr>
        <tr>
                <td class="code"></td>
                <td class="code"></td>
                <td class="code"></td>
                <td class="code"></td>
                <td class="code">in</td>
                <td class="code">avc_command_seq</td>
                <td class="code"></td>
                <td class="code">receivedSeqNum</td>
        </tr>
        <tr>
                <td class="code"></td>
                <td class="code"></td>
                <td class="code"></td>
                <td class="code"></td>
                <td class="code">in</td>
                <td class="code">avc_command_id</td>
                <td class="code"></td>
                <td class="code">receivedCmdId</td>
        </tr>
        <tr>
                <td class="code"></td>
                <td class="code"></td>
                <td class="code"></td>
                <td class="code"></td>
                <td class="code">in</td>
                <td class="code">avc_command_execution_stage</td>
                <td class="code"></td>
                <td class="code">stage</td>
        </tr>
        <tr>
                <td class="code"></td>
                <td class="code"></td>
                <td class="code"></td>
                <td class="code"></td>
                <td class="code">in</td>
                <td class="code">avc_command_result</td>
                <td class="code"></td>
                <td class="code">result</td>
        </tr>
</table>



### Alarms Sheet
This sheet must be named "Alarms", and the columns described must not be reordered. The sheet defines how the monitoring results of a parameter should be derived. E.g. if a parameter exceeds some pre-defined value, this parameter's state changes to <tt>CRITICAL</tt>.

<table class="inline">
	<tr>
		<th>parameter name</th>
		<td>The reference name of the parameter for which this alarm definition applies</td>
	</tr>
	<tr>
		<th>context</th>
		<td>
			<p>A condition under which the defined triggers apply. This can be used to define multiple different sets of triggers for one and the same parameter, that apply depending on some other condition (typically a state of some kind). When left blank, the defined set of conditions are assumed to be part of the <em>default</em> context.</p>
			<p>Contextual alarms are evaluated from top to bottom, until a match is found. If no context conditions apply, the default context applies.</p>
		</td>
	</tr>
	<tr>
		<th>report</th>
		<td>When alarms under the given context should be reported. Should be one of <tt>OnSeverityChange</tt> or <tt>OnValueChange</tt>. With <tt>OnSeverityChange</tt> being the default. The condition <tt>OnValueChange</tt> will check value changes based on the engineering values. It can also be applied to a parameter without any defined severity levels, in which case an event will be generated with every change in value.</td>
	</tr>
	<tr>
		<th>minimum violations</th>
		<td>Number of successive instances that meet any of the alarm conditions under the given context before the alarm event triggers (defaults to 1). This field affects when an event is generated (i.e. only after X violations). It does not affect the monitoring result associated with each parameter. That would still be out of limits, even after a first violation.</td>
	</tr>
	<tr>
		<th>watch: trigger type</th>
		<td>One of <tt>low</tt>, <tt>high</tt> or <tt>state</tt>. For each context of a numeric parameter, you can have both a low and a high trigger that lead to the <tt>WATCH</tt> state. For each context of an enumerated parameter, you can have multiple state triggers that lead to the <tt>WATCH</tt> state.</td>
	</tr>
	<tr>
		<th>watch: trigger value</th>
		<td>
			<p>If the trigger type is <tt>low</tt> or <tt>high</tt>: a numeric value indicating the low resp. high limit value. The value is considered inclusive with respect to its nominal range. For example, a low limit of 20, will have a <tt>WATCH</tt> alarm if and only if its value is smaller than 20.</p>
			<p>If the trigger value is <tt>state</tt>: a state that would bring the given parameter in its <tt>WATCH</tt> state.</p>
		</td>
	</tr>
	<tr>
		<th>warning: trigger type<br>warning: trigger value</th>
		<td>Analogous to <tt>watch</tt> condition</td>
	</tr>
	<tr>
		<th>distress: trigger type<br>distress: trigger value</th>
		<td>Analogous to <tt>watch</tt> condition</td>
	</tr>
	<tr>
		<th>critical: trigger type<br>critical: trigger value</th>
		<td>Analogous to <tt>watch</tt> condition</td>
	</tr>
	<tr>
		<th>severe: trigger type<br>severe: trigger value</th>
		<td>Analogous to <tt>watch</tt> condition</td>
	</tr>
</table>

#### Example Definition

<table class="inline small-contents">
	<tr>
		<th>param name</th>
		<th>context</th>
		<th>rep</th>
		<th>min.v</th>
		<th colspan="2" style="text-align: center">watch</th>
		<th colspan="2" style="text-align: center">warning</th>
		<th colspan="2" style="text-align: center">distress</th>
		<th colspan="2" style="text-align: center">critical</th>
		<th colspan="2" style="text-align: center">severe</th>
	</tr>
	<tr>
		<th></th>
		<th></th>
		<th></th>
		<th></th>
		<th>type</th>
		<th>val</th>
		<th>type</th>
		<th>val</th>
		<th>type</th>
		<th>val</th>
		<th>type</th>
		<th>val</th>
		<th>type</th>
		<th>val</th>
	</tr>
	<tr>
		<td class="code">int_para</td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code">low</td>
		<td class="code">-11</td>
		<td class="code">low</td>
		<td class="code">-22</td>
		<td class="code">low</td>
		<td class="code">-33</td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
	</tr>
	<tr>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code">high</td>
		<td class="code">30</td>
		<td class="code">high</td>
		<td class="code">40</td>
		<td class="code">high</td>
		<td class="code">50</td>
		<td class="code">high</td>
		<td class="code">60</td>
		<td class="code">high</td>
		<td class="code">70</td>
	</tr>
	<tr>
		<td class="code">&nbsp;</td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
	</tr>
	<tr>
		<td class="code"></td>
		<td class="code">other_para = 4</td>
		<td class="code"></td>
		<td class="code">3</td>
		<td class="code">high</td>
		<td class="code">40</td>
		<td class="code">high</td>
		<td class="code">50</td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code">high</td>
		<td class="code">70</td>
		<td class="code"></td>
		<td class="code"></td>
	</tr>
	<tr>
		<td class="code">&nbsp;</td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
	</tr>
	<tr>
		<td class="code">enum_para</td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code">state</td>
		<td class="code">ST1</td>
		<td class="code">state</td>
		<td class="code">ST2</td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code">state</td>
		<td class="code">ST4</td>
		<td class="code"></td>
		<td class="code"></td>
	</tr>
	<tr>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code">state</td>
		<td class="code">ST3</td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
	</tr>
</table>


### Commands Sheet
This sheet must be named “Commands”, and the columns described must not be reordered.
The sheet contains commands description, including arguments. General convention:

* First line with a new 'Command name' starts a new command
* Second line after a new 'Command name' should contain the first command arguments
* Empty lines are only allowed between two commands.

<table class="inline">
	<tr>
		<th>Command name</th>
		<td>The name of the command. Any entry starting with `#` is treated as a comment row</td>
	</tr>
	<tr>
		<th>parent</th>
		<td>
			<p>name of the parent command if any.</p>
			<p>Can be specified starting with / for an absolute reference or with ../ for pointing to parent SpaceSystem :x means that the arguments in this container start at position x (in bits) relative to the topmost container. Currently there is a problem for containers that have no argument: the bit position does not apply to children and has to be repeated.</p>
		</td>
	</tr>
	<tr>
		<th>argAssignment</th>
		<td>name1=value1;name2=value2.. where name1,name2.. are the names of arguments which are assigned when the inheritance takes place</td>
	</tr>
	<tr>
		<th>flags</th>
		<td>For commands: A=abstract. For arguments: L = little endian</td>
	</tr>
	<tr>
		<th>argument name</th>
		<td>From this column on, most of the cells are valid for arguments only. These have to be defined on a new row after the command. The exceptions are: description, aliases</td>
	</tr>
	<tr>
		<th>relpos</th>
		<td>Relative position to the previous argument
default is 0</td>
	</tr>
	<tr>
		<th>encoding</th>
		<td>How to convert the raw value to binary. The supported encodings are listed in the table below.</td>
	</tr>
	<tr>
		<th>eng type</th>
		<td>
			Dngineering type; can be one of: uint, int, float, string, binary, enumerated, boolean or FixedValue.
			FixedValue is like binary but is not considered an argument but just a value to fill in the packet.
		</td>
	</tr>
	<tr>
		<th>raw type</th>
		<td>Raw type: one of the types defined in the table below.</td>
	</tr>
	<tr>
		<th>(default) value</th>
		<td>Default value. If eng type is FixedValue, this has to contain the value in hexadecimal. Note that when the size of the argument is not an integer number of bytes (which is how hexadecimal binary strings are specified), the most significant bits are ignored.</td>
	</tr>
	<tr>
		<th>eng unit</th>
		<td></td>
	</tr>
	<tr>
		<th>calibration</th>
		<td>Point to a calibration from the Calibration sheet</td>
	</tr>
	<tr>
		<th>range low</th>
		<td>The value of the argument cannot be smaller than this. For strings and binary arguments this means the minimum length in characters, respectively bytes.</td>
	</tr>
	<tr>
		<th>range high</th>
		<td>The value of the argument cannot be higher than this. Only applies to numbers. For strings and binary arguments this means the minimum length in characters, respectively bytes.</td>
	</tr>
	<tr>
		<th>description</th>
		<td>Optional free text description</td>
	</tr>
</table>

#### Encoding and Raw Types for command arguments
The raw type and encoding describe how the argument is encoded in the binary packet. All types are case-insensitive.

<table class="inline">
        <tr>
                <th>Raw Type</th>
                <th>Encoding</th>
                <th>Description</th>
        </tr>
        <tr>
                <td class="code" rowspan="2">uint</td>
                <td class="code">unsigned(&lt;n&gt,&lt;BE|LE&gt;)</td>
                <td>Unsigned integer.
                    <ul>
                       <li>n is size in bits.</li>
                       <li>LE = little endian, BE = big endian.</li>
                    </ul>
                </td>
        </tr>
        <tr>
               <td class="code">&lt;n&gt;</td>
               <td> shortcut for <tt>unsigned(&lt;n&gt;,BE)</tt></td>
        </tr>
        
        <tr>
                <td class="code" rowspan="3">int</td>
                <td class="code">twosComplement(&lt;n&gt;, &lt;BE|LE&gt;)</td>
                <td>two's complement encoding
                  <ul>
                       <li>n is size in bits.</li>
                       <li>LE = little endian, BE = big endian.</li>
                    </ul>
                </td>
        </tr>
        <tr>                
                <td class="code">signMagnitude(&lt;n&gt;, &lt;BE|LE&gt;)</td>
                <td>sign magnitude encoding - first (or last for LE) bit is the sign, the remaining bits represent the magnitude (absolute value).
                     <ul>
                       <li>n is size in bits.</li>
                       <li>LE = little endian, BE = big endian.</li>
                    </ul>
                </td>
        </tr>
        <tr>                
                <td class="code">&lt;n&gt;</td>
                <td>shortcut for <tt>twosComplement(&lt;n&gt;,BE)</tt>
                </td>
        </tr>
        
        <tr>
                <td class="code" rowspan="2">float</td>
                <td class="code">ieee754_1985(&lt;n&gt;, &lt;BE|LE&gt;)</td>
                <td>IEE754_1985 encoding
                      <ul>
                       <li>n is size in bits.</li>
                       <li>LE = little endian, BE = big endian.</li>
                    </ul>
                </td>
        </tr>
        <tr>
                <td class="code">&lt;n&gt;</td>
                <td>shortcut for <tt>iee754_1985(&lt;n&gt;,BE)</tt></td>
        </tr>
        <tr>
                <td class="code">boolean</td>
                <td>&lt;empty&gt;</td>
                <td>the encoding has to be empty - 1 bit is assumed.</td>
        </tr>
        <tr>
                <td class="code" rowspan="4">string</td>
                <td class="code">fixed(&lt;n&gt;, &lt;charset&gt;)</td>
                <td>fixed size string
                  <ul>
                    <li> <tt>n</tt> is the size in bits of the string. Only multiple of 8 supported.</li>
                    <li><tt>charset</tt> is one of the <a href="https://docs.oracle.com/javase/8/docs/api/java/nio/charset/Charset.html">charsets supported by java</a> (UTF-8, ISO-8859-1, etc).<br>    
                    If not specified, it is by default UTF-8</li>
                </ul>               
                </td>
                
        </tr>
        <tr>
                <td class="code">PrependedSize(&lt;x&gt;, &lt;charset&gt;&lt;m;&gt)</td>
                <td>The size of string <b>in bytes</b> is specified in first <tt>x</tt> bits of string - the size itself will not be part of the string.<br>
                  <ul>
                    <li><tt>x</tt> is the size in bits of the size tag</li>
                    <li><tt>charset</tt> is as defined above.<br></li>
                    <li><tt>m</tt> if specified, it is the minimum size in bits of the encoded value. Note that the prepended size reflects the real size of the string even if smaller than this minimum size. This option has been added for compatibility with the Airbus CGS system but its usage is discouraged since it is not compliant with XTCE.<br></li>
                  </ul>
                </td>
        </tr>
        <tr>
                <td class="code">&lt;n&gt;</td>
                <td>shortcut for <tt>fixed(&lt;n&gt;)</tt></td>
        </tr>
        <tr>
                <td class="code">terminated(&lt;0xBB&gt;, &lt;charset&gt;&lt;m;&gt)</td>
                <td>terminated string;
                   <ul>
                     <li><tt>0xBB</tt> specifies a byte that is the string terminator</li>
                     <li><tt>charset</tt> is as defined above.</li>
                     <li><tt>m</tt> if specified is the minimum size in bits of the encoded value. Note that the termination character reflects the real size of the string even if smaller than this minimum size. This option has been added for compatibility with the Airbus CGS system but its usage is discouraged since it is not compliant with XTCE.</li>
                   </ul>
               </td>
        </tr>
        <tr>
                <td class="code" rowspan="3">binary</td>
                <td class="code">fixed(&lt;n&gt;)</td>
                <td>fixed size byte array.
                <ul>
                  <li><tt>n</tt> size of the array in bits. It has to be multiple of 8 and the argument has to start at a byte boundary.</li>
                </ul>  
               </td>
        </tr>
        <tr>                
                <td class="code">PrependedSize(&lt;x&gt;)</td>
                <td>byte array whose size in bytes is specified in the first <tt>x</tt> bits of the array - the size itself will not be part of the raw value.
                  <ul>
                    <li><tt>x</tt> is the size in bits of the size tag</li>                   
                  </ul>
                    Note that while x can be any number of bits<=32, the byte array has to start at a byte boundary.
                </td>
        </tr>
        <tr>                
                <td class="code">&lt;n&gt;</td>
                <td>shortcut for fixed(&lt;n&gt;)
                </td>
        </tr>       
</table>
    
### Command Options Sheet
This sheet must be named “CommandOptions”, and the columns described must not be reordered.
This sheet defines two types of options for commands:
<ul>
 <li>transmission constraints - these are conditions that have to be met in order for the command to be sent.</li>
 <li>command significance - this is meant to flag commands that have a certain significance. Currently the significance is only used by the end user applications (e.g. Yamcs Studio) to raise the awarness of the operator when sending such command.</li>
</ul>

<table class="inline">
<tr><th>Command name</th><td>The name of the command. Any entry starting with `#` is treated as a comment row</td></tr>
<tr><th>Transmission Constraints</th><td>Constrains can be specified on multiple lines.
All of them have to be met for the command to be allowed for transmission.
</td></tr>
<tr><th>Constraint Timeout</th><td>This refers to the left column.
A command stays in the queue for that many milliseconds. If the constraint is not met, the command is rejected.
0 means that the command is rejected even before being added to the queue, if the constraint is not met.
</td></tr>
<tr><th>Command Significance</th><td>Significance level for commands. Depending on the configuration, an extra confirmation or certain privileges may be required to send commands of high significance.
one of:
- none
- watch
- warning
- distress
- critical
- severe
</td></tr>
<tr><th>Significance Reason</th><td>A message that will be presented to the user explaining why the command is significant.
</td></tr>
</table>


### Command Verification Sheet
The Command verification sheets defines how a command shall be verified once it has been sent for execution.

The transmission/execution of a command usual goes through multiple stages and a verifier can be associated to each stage.
Each verifier runs within a defined time window which can be relative to the release of the command or to the completion of the previous verifier. The verifiers have three possible outcomes:
  <ul>
   <li> OK = the stage has been passed successfully.</li>
   <li> NOK = the stage verification has failed (for example there was an error on-board when executing the command, or the uplink was not activated).</li>
   <li> timeout - the condition could not be verified within the defined time interval.</li>
  </ul>
For each verifier it has to be defined what happens for each of the three outputs. 

<table class="inline">
<tr>
  <th>Command name</th>
  <td>The command relative name as defined in the Command sheet. Referencing commands from other subsystems is not supported.</td>
</tr>

<tr>
   <th>CmdVerifier Stage</th>
   <td>
    Any name for a stage is accepted but XTCE defines the following ones:
    <ul>
      <li>TransferredToRange</li>
      <li>SentFromRange</li>
      <li>Received</li>
      <li>Accepted</li>
      <li>Queued</li>
      <li>Execution</li>
      <li>Complete</li>
      <li>Failed</li>
    </ul>
    Yamcs interprets these as strings without any special semantics.
    If special actions (like declaring the command as completed) are required for Complete or Failed, they have to be configured in OnuSccess/OnFail/OnTimeout columns. By default command history events with the name Verification_&lt;stage&gt; are generated."
  </td>
</tr>

<tr>
   <th>CmdVerifier Type</th>
   <td>
     Supported types are:
     <ul>
       <li>container – the command is considered verified when the container is received. Note that this cannot generate a Fail (NOK) condition - it's either OK if the container is received in the timewindow or timeout if the container is not received.</li>
       <li>algorithm – the result of the algorithm run is used as the output of the verifier. If the algorithm is not run (because it gets no inputs) or returns null, then the timeout condition applies</li>
     </ul>
    </td>
</tr>
<tr>
  <th>CmdVerifier Text </th>
  <td>
    Depending on the type: 
    <ul>
      <li>container: is the name of the container from the Containers sheet. Reference to containers from other space systems is not supported.</li>
      <li>algorithm: is the name of the algorithm from the Algorithms sheet. Reference to algorithms from other space systems is not supported.</li>
     </ul>
   </td>
</tr>

<tr>
   <th>Time Check Window</th>
   <td>start,stop in milliseconds defines when the verifier starts checking the command and when it stops. </td>
</tr>

<tr>
  <th>checkWindow is relative to</th>
  <td>
    <ul>
      <li>LastVerifier (default) – the start,stop in the window definition are relative to the end of the previous verifier. If there is no previous verifier, the start,stop are relative to the command release time. If the previous verifier ends with timeout, this verifier will also timeout without checking anything.</li>
      <li>CommandRelease - the start,stop in the window definition are relative to the command release.</li>
    </ul>
  </td>
</tr>

<tr>
  <th>OnSuccess</th>
  <td>
  	Defines what happens when the verification returns true. It has to be one of:
	<ul>
		<li>SUCCESS: command considered completed successful (CommandComplete event is generated)</li>
		<li>FAIL:  CommandFailed event is generated</li>
		<li>none (default) – only a Verification_stage event is generated without an effect on the final execution status of the command.</li>
	</ul>
  </td>
</tr>
<tr>
    <th>OnFail</th>
    <td> Same like OnSuccess but the evnet is generated in case the verifier returns false.</td>
</tr>
<tr>
    <th>OnTimeout</th>
    <td>Same as OnSuccess but the event is generated in case the verifier times out.</td>
</tr>

</table>



### Change Log Sheet
This sheet must be named “ChangeLog”, and the columns described must not be reordered.
This sheet contains the list of the revision made to the MDB.


