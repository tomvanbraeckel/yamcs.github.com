---
layout: default
permalink: /docs/api/Issue_a_Command/
sidebar: yes
---

Issue a new command of the given type:

    POST /api/processors/:instance/:processor/commands/:namespace/:name
    
The `:namespace` segment can be any of the valid namespaces for this command. In case of fully qualified XTCE names, the `:namespace` segment must be repeated for every nested space system.

For example these URIs both point to the same command resource:

    /api/processors/simulator/realtime/commands/MDB%3AOPS+Name/SIMULATOR_SWITCH_VOLTAGE_OFF
    /api/processors/simulator/realtime/commands/YSS/SIMULATOR/SWITCH_VOLTAGE_OFF
    
Notice the use of `%3A` and `+` to URL-encode `MDB:OPS Name` to the ASCII character set. The server supports UTF-8 but your client may not.
    
After validating the input parameters, the command will be added to the appropriate command queue for further dispatch.

### Parameters

<table class="inline">
  <tr>
    <th>Name</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td class="code">origin</td>
    <td class="code">string</td>
    <td>The origin of the command. Typically in "user@host" format.</td>
  </tr>
  <tr>
    <td class="code">sequenceNumber</td>
    <td class="code">integer</td>
    <td>The sequence number as specified by the origin.</td>
  </tr>
  <tr>
    <td class="code">dryRun</td>
    <td class="code">bool</td>
    <td>Whether a response will be returned without actually issuing the command. This is useful when debugging commands. Default <tt>no</tt></td>
  </tr>
  <tr>
    <td class="code">assignment</td>
    <td class="code">array&nbsp;of<br>string&nbsp;pairs</td>
    <td>
      <p>The name/value assignments for this command.</p>
      <p><strong>Note:</strong> We enjoy simple curl-able APIs, so we made it possible to provide assignments in the query string in the format <tt>name=value</tt>. However, when building your own client, make sure to use the request body to prevent any potential naming collisions with other URI parameters.</p>
    </td>
  </tr>
  <tr>
    <td class="code">pretty</td>
    <td class="code">bool</td>
    <td>Format the JSON result in a human readable manner. Default: <tt>no</tt></td>
  </tr>
</table>


### Example

{% highlight json %}
{
  "sequenceNumber" : 1,
  "origin" : "user@my-machine",
  "assignment" : [ {
    "voltage_num": 3
  } ],
  "dryRun" : true
}
{% endhighlight %}

### Response

{% highlight json %}
{
  "queue" : "default",
  "source" : "SWITCH_VOLTAGE_ON(voltage_num: 3)",
  "hex" : "1864C000000000000000006A0000000103",
  "binary" : "GGTAAAAAAAAAAABqAAAAAQM="
}
{% endhighlight %}

The binary is encoded in Base64 format.

### Protobuf

Request body is of type `Rest.IssueCommandRequest`:

{% highlight nginx %}
message IssueCommandRequest {
  message Assignment {
    optional string name = 1;
    optional string value = 2;
  }
  repeated Assignment assignment = 1;
  optional string origin = 2;
  optional int32 sequenceNumber = 3;
  optional bool dryRun = 4;
}
{% endhighlight %}

Response body is of type `Rest.IssueCommandResponse`:

{% highlight nginx %}
message IssueCommandResponse {
  optional string queue = 1;
  optional string source = 2;
  optional string hex = 3;
  optional bytes binary = 4;
}
{% endhighlight %}
