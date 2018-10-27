---
layout: default
permalink: /docs/http/List_Packets/
sidebar: yes
---

List the history of packets:

    GET /api/archive/:instance/packets
    
List the packets for the specified generation time

    GET /api/archive/:instance/packets/:gentime
    
The <tt>:gentime</tt> must be in ISO 8601 format. E.g. 2015-10-20T06:47:02.000Z

### Parameters

<table class="inline">
    <tr>
        <th>Name</th>
        <th>Type</th>
        <th>Description</th>
    </tr>
    <tr>
        <td class="code">name</td>
        <td class="code">array of strings</td>
        <td>
            The archived name of the packets. Both these notations are accepted:
            <ul>
                <li><tt>?name=/YSS/SIMULATOR/DHS,/YSS/SIMULATOR/Power</tt></li>
                <li><tt>?name[]=/YSS/SIMULATOR/DHS&name[]=/YSS/SIMULATOR/Power</tt></li>
            </ul>
            Names must match exactly.
        </td>
    </tr>
    <tr>
        <td class="code">start</td>
        <td class="code">string</td>
        <td>Filter the lower bound of the packet's generation time. Specify a date string in ISO 8601 format. This bound is inclusive.</td>
    </tr>
    <tr>
        <td class="code">stop</td>
        <td class="code">string</td>
        <td>Filter the upper bound of the packet's generation time. Specify a date string in ISO 8601 format. This bound is exclusive.</td>
    </tr>
    <tr>
        <td class="code">pos</td>
        <td class="code">integer</td>
        <td>The zero-based row number at which to start outputting results. Default: <tt>0</tt></td>
    </tr>
    <tr>
        <td class="code">limit</td>
        <td class="code">integer</td>
        <td>The maximum number of returned records per page. Choose this value too high and you risk hitting the maximum response size limit enforced by the server. Default: <tt>100</tt></td>
    </tr>
    <!--tr>
        <td class="code">q</td>
        <td class="code">string</td>
        <td>The search keywords.</td>
    </tr-->
    <tr>
        <td class="code">order</td>
        <td class="code">string</td>
        <td>The order of the returned results. Can be either <tt>asc</tt> or <tt>desc</tt>. Default: <tt>desc</tt></td>
    </tr>
</table>

The <tt>pos</tt> and <tt>limit</tt> allow for pagination. Keep in mind that in-between two requests extra data may have been recorded, causing a shift of the results. This generic stateless operation does not provide a reliable mechanism against that, so address it by overlapping your <tt>pos</tt> parameter with rows of the previous query. In this example we overlap by 4:

    ?pos=0&limit=50&order=desc
    ?pos=45&limit=50&order=desc
    
An alternative is to download the packets instead.


### Response

<pre class="header">
Status: 200 OK
</pre>

```json
{ 
  "packet" : [ {
    "receptionTime" : 1447625895283,
    "packet" : "CAEAAABFQ3PHAzxFAAAAIUMCgADCcgxKQlS0OUYh0ADDClmaP9AnUj9yMP1DV9wpQ1fcKT85frs/dofTQwErhUJLPXHCDdLywwpZmg==",
    "generationTime" : 1447625878234,
    "sequenceNumber" : 134283264
  } ] 
}
```


### Alternative Media Types

#### Protobuf

Use HTTP header:

    Accept: application/protobuf
    
Response is of type:

<pre class="r header"><a href="{{ site.proto }}/rest/rest.proto">rest.proto</a></pre>
```proto
message ListPacketsResponse {
  repeated yamcs.TmPacketData packet = 1;
}
```
