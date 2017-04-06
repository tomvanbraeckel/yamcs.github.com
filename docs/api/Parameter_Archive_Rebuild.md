---
layout: default
permalink: /docs/api/Parameter_Archive_Rebuild/
sidebar: yes
---

Rebuild (backfill) parts of the parameter archive:

    POST /api/archive/:instance/parameterArchive/rebuild    

The back filler has to be enabled for this purpose, the configuration of the back filler is described in the [Parameter Archive](../../server/Parameter_Archive) section.
The back filling process does not remove data but just overwrites it. That means that if the parameter replay returns less parameters than originally stored in the archive, the old parameters will still be found in the archive.
It also means that if a replay returns the parameter of a different type than originally stored, the old ones will still be stored. This is because the parameter archive treats parameter with the same name but different type as different parameters. Each of them is given an id and the id is stored in the archive.

If you want to remove data from the archive, use the [Delete Partitions](../Delete_Partitions) call. Currently this can be done only for entire partitions. A partition is approximatively 25 days (2<sup>31</sup> milliseconds).

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
        <td>Start rebuilding from here. Specify a date string in ISO 8601 format.</td>
    </tr>
    <tr>
        <td class="code">stop</td>
        <td class="code">string</td>
        <td>Rebuild until here. Specify a date string in ISO 8601 format.</td>
    </tr> 
</table>
 
 Note that the archive is build in segments of approximatively 70 minutes, therefore the real start will be before the specified start and the real stop will be after the specified stop.

### Response

<pre class="header">Status: 200 OK</pre>
