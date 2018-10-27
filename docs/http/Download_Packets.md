---
layout: default
permalink: /docs/http/Download_Packets/
sidebar: yes
---

Download archived packets:

    GET /api/archive/:instance/downloads/packets

<div class="hint">
This operation will possibly download a very large file. If you worry about size for your application, check out the support for <a href="/docs/http/List_Packets/">paged packet retrievals</a> instead.
</div>


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
        <td class="code">order</td>
        <td class="code">string</td>
        <td>The order of the returned results. Can be either <tt>asc</tt> or <tt>desc</tt>. Default: <tt>asc</tt></td>
    </tr>
</table>


### Response

The response will be a stream of self-standing JSON messages.


### Alternative Media Types

#### Raw binary

Use HTTP header:

    Accept: application/octet-stream

Or add the query parameter `format=raw`.

#### Protobuf

Use HTTP header:

    Accept: application/protobuf

The response is a stream of self-standing <tt>VarInt</tt> delimited messages of type:

<pre class="r header"><a href="{{ site.proto }}/yamcs.proto">yamcs.proto</a></pre>
```proto
message TmPacketData {
  required int64 receptionTime = 1;
  required bytes packet = 2;
  optional int64 generationTime = 3;
  optional int32 sequenceNumber = 4;
  optional NamedObjectId id = 5;
}
```
