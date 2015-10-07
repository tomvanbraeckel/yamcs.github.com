---
layout: default
permalink: /docs/server/Excel_Specification/
sidebar: yes
---

Yamcs offers various ways of defining TM packets, parameters, commands and other mission items. The recommended way is to use a spreadsheet. This offers a good mixture between easy user manipulation and flexibility. This section explains the general and structural conventions that apply when defining a space system using Excel.

* TOC
{:toc}

### Conventions

* If specified, every opsname will automatically be prepended with the <tt>opsname prefix</tt> from the 'General' sheet
* The actual descriptive part of opsnames is WordCapitalized (eg. <tt>HK_WatchdogError</tt>)
* All numeric values can be entered as decimals or as hexadecimals (with prefix <tt>0x</tt>)
* Although column names are used for reference below, columns must not be reordered

A number of mandatory named sheets are described as part of this specification, though authors may add their own sheets and still use the spreadsheet file as the reference MDB.

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
	<tr>
		<th>opsname prefix</th>
		<td>Optional value which will automatically be prepended before every opsname, useful if all the parameters have a common system prefix</td>
	</tr>
</table>

### Containers Sheet
This sheet must be named "Containers", and the columns described must not be reordered. The sheet contains packets information, including their measurements. General conventions:

* first line with a new 'container name' starts a new packet
* second line after a new 'container name' should contain the first measurement
* empty lines are only allowed between two packets

<table class="inline">
	<tr>
		<th>container name</th>
		<td>The opsname of the packet</td>
	</tr>
	<tr>
		<th>parent</th>
		<td>Parent container and position in bits where the subcontainer starts, for example  <tt>PARENT_CONTAINER:64</tt>. If position in bits is not specified, the default position is to start from the last parameter in the parent. If parent is not specified, either the container is the root, or it can be used as part of another container in aggregation.</td>
	</tr>
	<tr>
		<th>condition</th>
		<td>Inheritance condition, usually specifies a switch within the parent which activates this child, for example `MID=0x101`</td>
	</tr>
	<tr>
		<th>flags</th>
		<td>
			Used to encode special cases. Flags are case-insensitive and can be concatenated together.
			<ul>
				<li><tt>I</tt> &ndash; ignore completely when generating the Oracle MDB (In Yamcs the parameter is <em>not</em> ignored)</li>
				<li><tt>D</tt> &ndash; derived value, in this case the measurement must not have a calibration</li>
				<li><tt>L</tt> &ndash; little endian value</li>
			</ul>
		</td>
	</tr>
	<tr>
		<th>parameter name</th>
		<td>The opsnames of the Parameters contained within this container, one per line after the line defining the opsname. Parameters are defined in the Parameters sheet. Note that the first parameter of a packet may not be on the same line as the packet opsname. Extension: for the SOLAR Instruments, this column has been extended to mean not only a measurement but also another packet in case the extension mechanism specified above is not enough.</td>
	</tr>
	<tr>
		<th>relpos</th>
		<td>Relative position (offset) of a measurement to its predecessor. A relpos of 1 means no gap between two measurements. A relpos of 9 means a gap of one byte (i.e. 8 irrelevant bits).</td>
	</tr>
	<tr>
		<th>size in bits</th>
		<td>The size of the container in bits. This is not usually needed but if the container is part of another container through aggregation, this size is used to determine the position of the next entry in the master container.</td>
	</tr>
	<tr>
		<th>expected interval</th>
		<td>If the container is not updated in this interval, all the parameters from it are marked as expired</td>
	</tr>
	<tr>
		<th>description</th>
		<td>Optional human-readable text</td>
	</tr>
	<tr>
		<th>namespace:MDB:Pathname</th>
		<td>Optional MDB alias for the packet</td>
	</tr>
</table>

### Parameters Sheet
This sheet must be named "Parameters", and the columns described must not be reordered. The sheet contains measurements information (both for TM and RESP packets), excluding their calibration.

<table class="inline">
	<tr>
		<th>opsname</th>
		<td>The opsname of the measurements. Any entry starting with `#` is treated as a comment row</td>
	</tr>
	<tr>
		<th>bitlength</th>
		<td>Length of the measurement, in bits, not needed for terminatedstring raw types</td>
	</tr>
	<tr>
		<th>raw type</th>
		<td>See <a href="#raw-types">Raw Types</a></td>
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
		<th>namespace:MDB:Pathname</th>
		<td>Optional MDB alias for the packet</td>
	</tr>
</table>

#### Raw Types
Raw types describe how the parameter is encoded in the raw packet. All types are case-insensitive.

<table class="inline">
	<tr>
		<th>Type</th>
		<th>Description</th>
	</tr>
	<tr>
		<td class="code">uint</td>
		<td>Unsigned integer, need to specify bit length</td>
	</tr>
	<tr>
		<td class="code">float</td>
		<td>Floating point number, need to specify bit length</td>
	</tr>
	<tr>
		<td class="code">int</td>
		<td>Synonymous to <tt>int(2s)</tt></td>
	</tr>
	<tr>
		<td class="code">int(2s)</td>
		<td>Signed integer using 2's complement binary representation, need to specify bit length</td>
	</tr>
	<tr>
		<td class="code">int(si)</td>
		<td>Signed integer using sign-magnitude binary representation, need to specify bit length</td>
	</tr>
	<tr>
		<td class="code">boolean</td>
		<td>Boolean value of 1 bit. Value 1 is true and 0 is false. The bit length must not be defined as it is assumed to be 1</td>
	</tr>
	<tr>
		<td class="code">bytestream</td>
		<td>Catch-all for any binary data, need to specify bit length</td>
	</tr>
	<tr>
		<td class="code">string</td>
		<td>Synonymous to <tt>TerminatedString(0x0)</tt></td>
	</tr>
	<tr>
		<td class="code">TerminatedString(0x0)</td>
		<td>A string terminated by the specified byte.</td>
	</tr>
	<tr>
		<td class="code">FixedString</td>
		<td>Fixed length string, specify size in bitlength</td>
	</tr>
	<tr>
		<td class="code">PrependedSizeString</td>
		<td>Has size specified in the leading byte of the value</td>
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
		<td>Unsigned integer</td>
		<td>From type <tt>uint</tt> or <tt>string</tt></td>
	</tr>
	<tr>
		<td class="code">int</td>
		<td>Signed integer</td>
		<td>From <tt>int</tt>, <tt>uint</tt> or <tt>string</tt></td>
	</tr>
	<tr>
		<td class="code">string</td>
		<td>String</td>
		<td>From <tt>string</tt></td>
	</tr>
	<tr>
		<td class="code">float</td>
		<td>Floating point number</td>
		<td>From <tt>float</tt>, <tt>int</tt>, <tt>uint</tt> or <tt>string</tt></td>
	</tr>
	<tr>
		<td class="code">enumerated</td>
		<td>
			A kind of string that can only be one out of a fixed set of predefined state values. If the parameter's enumerated value is unknown, the state value <tt>UNDEF</tt> is used instead.
		</td>
		<td>
        	From <tt>int</tt> or <tt>uint</tt>. A Calibrator is required.
		</td>
	</tr>
	<tr>
		<td class="code">boolean</td>
		<td>A binary true/false value</td>
		<td>
			<p>From any raw type</p>
			<p>Values equal to zero, all-zero bytes or an empty string are considered <em>falsy</em></p>
		</td>
	</tr>
	<tr>
		<td class="code">binary</td>
		<td>Catch-all for any binary data</td>
		<td>From <tt>bytestream</tt> only</td>
	</tr>
</table>

### Derived Parameters Sheet
This sheet must be named “DerivedParameters”, and the columns described must not be reordered.
Derived Parameters are parameters whose values are output of Algorithms (defined in section Algorithm).

<table class="inline">
	<tr>
		<th>opsname</th>
		<td>The opsname of the parameter. Any entry starting with `#` is treated as a comment row</td>
	</tr>
	<tr>
		<th>bitlength</th>
		<td>Length of the measurement, in bits, not needed for terminatedstring raw types</td>
	</tr>
	<tr>
		<th>raw type</th>
		<td>See <a href="#raw-types">Raw Types</a></td>
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
		<th>namespace:MDB:Pathname</th>
		<td>Optional MDB alias for the packet</td>
	</tr>
</table>

### Local Parameters Sheet
This sheet must be named "LocalParameters", and the columns described must not be reordered.
Local parameters are equivalent to Parameters but can be written by Yamcs clients.

<table class="inline">
	<tr>
		<th>opsname</th>
		<td>The opsname of the parameter. Any entry starting with `#` is treated as a comment row</td>
	</tr>
	<tr>
		<th>bitlength</th>
		<td>Length of the measurement, in bits, not needed for terminatedstring raw types</td>
	</tr>
	<tr>
		<th>raw type</th>
		<td>See <a href="#raw-types">Raw Types</a></td>
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
		<th>namespace:MDB:Pathname</th>
		<td>Optional MDB alias for the packet</td>
	</tr>
</table>

### Calibration Sheet
This sheet must be named "Calibration", and the columns described must not be reordered. The sheet contains calibration data including enumerations

<table class="inline">
	<tr>
		<th>parameter name</th>
		<td>Name of the calibration.</td>
	</tr>
	<tr>
		<th>type</th>
		<td>
			<ul>
				<li><tt>polynomial</tt> for polynomial calibration</li>
				<li><tt>pointpair</tt> for pointpair calibration</li>
				<li><tt>identical</tt> for discrete calibration</li>
				<li><tt>enumeration</tt> for mapping enumeration states</li>
			</ul>
		</td>
	</tr>
	<tr>
		<th>calib1</th>
		<td>
			<ul>
				<li>If the type is <tt>polynomial</tt>: coefficient</li>
				<li>If the type is <tt>pointpair</tt>: start point</li>
				<li>If the type is <tt>identical</tt>: engineering value</li>
				<li>If the type is <tt>enumeration</tt>: numeric value</li>
			</ul>
		</td>
	</tr>
	<tr>
		<th>calib2</th>
		<td>
			<ul>
				<li>If the type is <tt>polynomial</tt>: leave <em>empty</em></li>
				<li>If the type is <tt>pointpair</tt>: stop point corresponding to the start point in <tt>calib1</tt></li>
				<li>If the type is <tt>identical</tt>: engineering value corresponding to the raw value in <tt>calib1</tt></li>
				<li>If the type is <tt>enumeration</tt>: text state corresponding to the numeric value in <tt>calib1</tt></li>
			</ul>
		</td>
	</tr>
</table>

### Algorithms Sheet
This sheet must be named "Algorithms", and the columns described must not be reordered. The sheet contains arbitrarily complex user algorithms that can set (derived) output parameters based on any number of input parameters.

<table class="inline">
	<tr>
		<th>algorithm name</th>
		<td>The identifying name of the algorithm. Any entry starting with <tt>#</tt> is treated as a comment row</td>
	</tr>
	<tr>
		<th>text</th>
		<td>The code of the algorithm</td>
	</tr>
	<tr>
		<th>trigger</th>
		<td>
			Optionally specify when the algorithm should trigger. If left blank, algorithms will trigger as soon as at least one of their input parameters is updated, which is expected to suit most use cases. Other options are:
			<ul>
				<li><tt>OnParameterUpdate('/some-param', 'some-other-param')</tt><br>Execute the algorithm whenever <em>any</em> of the specified parameters are updated</li>
				<li><tt>OnPeriodicRate(&lt;fireRate&gt;)</tt><br>Execute the algorithm every <tt>fireRate</tt> milliseconds</li>
			</ul>
		</td>
	</tr>
	<tr>
		<th>in/out</th>
		<td>Whether a parameter is inputted to, or outputted from the algorithm. Parameters are defined, one per line, following the line defining the algorithm name</td>
	</tr>
	<tr>
		<th>parameter name</th>
		<td>
			<p>Reference name of a parameter. Input parameters can come from any sort of parameter provider. Output parameters should be defined in the same spreadsheet as the algorithm definition.</p>
			<p>Both input and output parameters must be defined in the Parameters sheet and can have calibrations linked to them. In most cases there is no need to specify a bitsize for an output parameter.</p>
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
            
#### Example Definition

<table class="inline small-contents">
	<tr>
		<th>algo name</th>
		<th>text</th>
		<th>trigger</th>
		<th>in/out</th>
		<th>param name</th>
		<th>instance</th>
		<th>friendly<br>name</th>
	</tr>
	<tr>
		<td class="code">my_avg</td>
		<td class="code">r = (a.value + b.value + c.value) / 3;</td>
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
		<td class="code">in</td>
		<td class="code">/MY_SS/some_temperature</td>
		<td class="code">-2</td>
		<td class="code">a</td>
	</tr>
	<tr>
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
		<td class="code">in</td>
		<td class="code">/MY_SS/some_temperature</td>
		<td class="code">0</td>
		<td class="code">c</td>
	</tr>
	<tr>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code"></td>
		<td class="code">out</td>
		<td class="code">/MY_SS/avg_out</td>
		<td class="code"></td>
		<td class="code">r</td>
	</tr>
</table>


### Alarms Sheet
This sheet must be named "Alarms", and the columns described must not be reordered. The sheet defines how the monitoring results of a parameter should be derived. E.g. if a parameter exceeds some pre-defined value, this parameter's state changes to <tt>CRITICAL</tt>.

When monitoring results change, events are generated and can be followed in the Yamcs Event Viewer.

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
		<td>The opsname of the command. Any entry starting with `#` is treated as a comment row</td>
	</tr>
	<tr>
		<th>parent</th>
		<td>name of the parent command if any.
Can be specified starting with / for an absolute reference or with ../ for pointing to parent SpaceSystem
:x means that the arguments in this container start at position x (in bits) relative to the topmost container.
Currently there is a problem for containers that have no argument: the bit position does not apply to children and has to be repeated.</td>
	</tr>
	<tr>
		<th>argAssignement</th>
		<td>name1=value1;name2=value2.. where name1,name2.. are the names of arguments which are assigned when the inheritance takes place</td>
	</tr>
	<tr>
		<th>flags</th>
		<td>for comands:
A=abstract
for argument: 
L = little endian</td>
	</tr>
	<tr>
		<th>argument name</th>
		<td>from this column on, most of the parameters are valid for arguments only which have to come starting next row after the command. The exceptions are: -  - size in bits
- description
- aliases</td>
	</tr>
	<tr>
		<th>relpos</th>
		<td>relative position to the previous argument
default is 0</td>
	</tr>
	<tr>
		<th>size in bits</th>
		<td>size in bits of the raw value</td>
	</tr>
	<tr>
		<th>eng type</th>
		<td>engineering type; can be one of:
- uint
- int
- float
- string
- binary
- enumerated
- boolean
- FixedValue
FixedValue is like binary but is not considered an argument but just a value to fill in the packet.</td></tr>
<tr><th>raw type</th>
<td>raw type: can be one of uint, int, float or binary
</td></tr>
<tr><th>(default) value</th>
<td>"default value
if eng type is FixedValue, this has to contain the value in hexadecimal.
Note that when the size of the argument is not an integer number of bytes (which is how hexadecimal binary strings are specified), the most significant bits are ignored."
</td></tr>
<tr><th>eng unit</th>
<td></td></tr>
<tr><th>calibration</th>
<td>point to a calibration from the Calibration sheet
</td></tr>
<tr><th>range low</th>
<td>"the value of the argument cannot be smaller than this. 
For strings and binary arguments this means the minimum length in characters, respectively bytes."
</td></tr>
<tr><th>range high</th>
<td>"the value of the argument cannot be higher than this. Only applies to numbers.
For strings and binary arguments this means the minimum length in characters, respectively bytes."
</td></tr>
<tr><th>description</th>
<td>optional free text description</td>
	</tr>
</table>

### Command Options Sheet
This sheet must be named “CommandOptions”, and the columns described must not be reordered.
This sheet defines the options that can be applied to commands.

<table class="inline">
<tr><th>Command name</th><td>The opsname of the command. Any entry starting with `#` is treated as a comment row</td></tr>
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


### Change Log Sheet
This sheet must be named “ChangeLog”, and the columns described must not be reordered.
This sheet contains the list of the revision made to the MDB.

### Legacy Sheets
Legacy sheets remain supported, but are generally not used in new projects anymore.

#### MDB Sheet
This sheet is optional, but if present must be named "MDB". The columns described must not be reordered.

<table class="inline">
	<tr>
		<th>version<br>issue<br>revision<br>testversion</th>
		<td>Used for CDU version tracking</td>
	</tr>
	<tr>
		<th>instance</th>
		<td>Organisation</td>
	</tr>
	<tr>
		<th>systemtree</th>
		<td>Version of the system tree used</td>
	</tr>
	<tr>
		<th>cupath</th>
		<td>Path in MDB</td>
	</tr>
	<tr>
		<th>apid</th>
		<td>APID used for TCs</td>
	</tr>
	<tr>
		<th>element_configuration</th>
		<td>Root system</td>
	</tr>
	<tr>
		<th>mission<br>CDU version<br>CDU description</th>
		<td>Inserted into generated CDU</td>
	</tr>
</table>

#### TC Sheet
This sheet must be named "TC", and the columns described must not be reordered. The sheet contains telecommand descriptions and their parameters.

Constant parameters (i.e. cannot be chosen when building the command) are specified as constants (not a range, not an enum, only a lowlimit/value) and have no name.

Ordinary parameters (parameters to be filled in by the user of the TC) must have a name and an enum or a range.

Parameters that are calculated (eg. checksum) have a range or an enum but no name.

<table class="inline">
	<tr>
		<th>packet opsname</th>
		<td>The opsname of the TC</td>
	</tr>
	<tr>
		<th>packet partial full pathname</th>
		<td>The part of the full pathname, relative to the CDU (maintained by SpaceApps)</td>
	</tr>
	<tr>
		<th>packetid</th>
		<td>Identifying number</td>
	</tr>
	<tr>
		<th>response packet opsname</th>
		<td>The opsname of the response packet, can be left empty if no response packet is expected</td>
	</tr>
	<tr>
		<th>parameter name</th>
		<td>Each parameter is optionally given a name</td>
	</tr>
	<tr>
		<th>flags</th>
		<td>
			Used to encode special cases. Flags are case-insensitive and can be concatenated together.
			<ul>
				<li><tt>I</tt> &ndash; ignore completely when generating the Oracle MDB (in Yamcs the parameter is not ignored).</li>
				<li><tt>C</tt> &ndash; calculated value (only for parameters)</li>
			</ul>
		</td>
	</tr>
	<tr>
		<th>bits</th>
		<td>Specifies the number of bits the parameter has. Can be any non-zero number</td>
	</tr>
	<tr>
		<th>datatype</th>
		<td>
			<listitem>
				A <a href="#raw-types">raw type</a>: <tt>uint</tt>, <tt>int</tt>, <tt>string</tt>, <tt>varstr</tt>, <tt>float</tt> or <tt>enum</tt>.
				All case insensitive. <tt>string</tt> has a fixed size that is padded if necessary. <tt>varstr</tt> has a maximum size and will not be padded
			</listitem>
		</td>
	</tr>
	<tr>
		<th>rel position</th>
		<td>Specifies the offset of this parameter to the last bit of the previous parameter. No empty bits means a relative position of 1. Three irrelevant bits between parameter n and parameter n+1 means a relative position of 4</td>
	</tr>
	<tr>
		<th>Value/lowlimit</th>
		<td>
			Contains engineering values. There are several entry possibilities:
			<ul>
				<li>the column contains 1 value, but the highlimit column is left empty for this parameter, the value means a fixed value for this parameters</li>
				<li>the column contains 1 value and the highlimit column also contains a value for this parameter, the 2 values specify a range for this parameters</li>
				<li>the column contains semicolons and each value seperated between semicolons (do not use spaces before/after the semicolons) is either:
					<ul>
						<li>a '=' b pair. Lefthandside = textual representation of the righthandside value, this textual representations cannot be longer than 8 characters</li>
						<li>x where x is a number and meaning that any value larger or equal to x is also a valid value. Having this means that also a highlimit must be filled in combining the previous ones is also possible.</li>
					</ul>
					<br>
					For example, <tt>ON=1;OFF=0;3</tt> means that value 1 is encoded as <tt>ON</tt>, value 0 is encoded as <tt>OFF</tt> and any other value greater than or equal to 3 is also a valid value (if the highlimit field exists and is greater than 3)
				</li>
			</ul>
		</td>
	</tr>
	<tr>
		<th>highlimit</th>
		<td>The upper limit of the values that the parameter can take</td>
	</tr>
	<tr>
		<th>engunit</th>
		<td>Free-form engineering units for the parameters</td>
	</tr>
	<tr>
		<th>calibration</th>
		<td>Name of a calibration described in the <a href="#calibration-sheet">Calibration Sheet</a></td>
	</tr>
	<tr>
		<th>description</th>
		<td>An optional description for the commands or parameters.</td>
	</tr>
</table>
		
#### RESP Sheet
This sheet is optional, but if present must be named "RESP" and the columns must not be reordered. The sheet specifies the basic identifying information for packets which are expected in response to TC.

<table class="inline">
	<tr>
		<th>response opsname</th>
		<td>OpsName of the packet</td>
	</tr>
	<tr>
		<th>response partial full pathname</th>
		<td>The part of the full pathname, relative to the CDU (maintained by SpaceApps)</td>
	</tr>
	<tr>
		<th>apid</th>
		<td>APID to which the packet belongs</td>
	</tr>
	<tr>
		<th>packetid</th>
		<td>ID of the packet</td>
	</tr>
	<tr>
		<th>measurement opsname</th>
		<td>OpsName of the triggering packet</td>
	</tr>
	<tr>
		<th>relpos</th>
		<td></td>
	</tr>
	<tr>
		<th>description</th>
		<td>Optional human-readable text</td>
	</tr>
</table>
