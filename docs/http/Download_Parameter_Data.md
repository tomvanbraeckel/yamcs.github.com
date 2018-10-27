---
layout: default
permalink: /docs/http/Download_Parameter_Data/
sidebar: yes
---

Download archived parameters:

    GET /api/archive/:instance/downloads/parameters/:namespace/:name


<div class="hint">
This operation will possibly download a very large file. If you worry about size for your application, check out the support for <a href="/docs/http/List_Parameter_Data/">paged parameter retrievals</a> instead.
</div>


### Parameters

<table class="inline">
    <tr>
        <th>Name</th>
        <th>Type</th>
        <th>Description</th>
    </tr>
    <tr>
        <td class="code">start</td>
        <td class="code">string</td>
        <td>Filter the lower bound of the parameter's generation time. Specify a date string in ISO 8601 format</td>
    </tr>
    <tr>
        <td class="code">stop</td>
        <td class="code">string</td>
        <td>Filter the upper bound of the parameter's generation time. Specify a date string in ISO 8601 format</td>
    </tr>
    <tr>
        <td class="code">norepeat</td>
        <td class="code">bool</td>
        <td>Whether to filter out consecutive identical values. Default <tt>no</tt>.</td>
    </tr>
    <tr>
        <td class="code">order</td>
        <td class="code">string</td>
        <td>The order of the returned results. Can be either <tt>asc</tt> or <tt>desc</tt>. Default: <tt>asc</tt></td>
    </tr>
</table>

When using CSV output some columns are hidden by default. You can add them via the `extra` flag:

<table class="inline">
    <tr>
        <th>Name</th>
        <th>Type</th>
        <th>Description</th>
    </tr>
    <tr>
        <td class="code">extra</td>
        <td class="code">array of strings</td>
        <td>
            Extra columns added to the CSV output:
            <ul>
                <li><tt>raw</tt>: Raw parameter values</li>
                <li><tt>monitoring</tt>: Monitoring status</li>
            </ul>
            Example: <tt>?extra=raw,monitoring</tt>
        </td>
    </tr>
</table>


### Response

The response will be a stream of individual parameters.

### Multi-get

Get the value history of multiple parameters in one and the same request using this address:

    GET /api/archive/:instance/downloads/parameters

In addition to the parameters for the single parameter retrieval you can specify these:

<table class="inline">
    <tr>
        <th>Name</th>
        <th>Type</th>
        <th>Description</th>
    </tr>
    <tr>
        <td class="code">namespace</td>
        <td class="code">string</td>
        <td>Namespace used to display parameter names in e.g. csv header. Only used when no parameter ids were specified</td>
    </tr>
    <tr>
        <td class="code">ids</td>
        <td class="code">list of name pairs</td>
        <td>Parameters to be included in the output. If not specified, all parameters from the MDB will be dumped.</td>
    </tr>
</table>

Example: 

```json
{
  "id" : [ {
    "name": "YSS_ccsds-apid",
    "namespace": "MDB:OPS Name"
  }, {
    "name": "/YSS/SIMULATOR/BatteryVoltage2"
  } ]
}
```

POST requests are also allowed, because some HTTP clients do not support GET with a request body.

### Alternative Media Types

#### CSV

Use HTTP header:

    Accept: text/csv
    
Or add the query parameter `format=csv`.

#### Protobuf

Use HTTP header:

    Accept: application/protobuf


Bulk request is of type:

<pre class="r header"><a href="{{ site.proto }}/rest/rest.proto">rest.proto</a></pre>
```proto
message BulkDownloadParameterValueRequest {
  optional string start = 1;
  optional string stop = 2;
  repeated yamcs.NamedObjectId id = 3;
  optional string namespace = 4;
}
```

The response is a stream of self-standing <tt>VarInt</tt> delimited messages of type:
<pre class="r header"><a href="{{ site.proto }}/pvalue/pvalue.proto">pvalue.proto</a></pre>
```proto
message ParameterData {
  repeated ParameterValue parameter = 1;
}
```
