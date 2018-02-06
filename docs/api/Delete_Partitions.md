---
layout: default
permalink: /docs/api/Delete_Partitions/
sidebar: yes
---

Delete partitions from the parameter archive.

    GET /api/archive/:instance/parameterArchive/deletePartitions   


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
        <td>Start with the partition that contains this timestamp. Specify a date string in ISO 8601 format.</td>
    </tr>
    <tr>
        <td class="code">stop</td>
        <td class="code">string</td>
        <td>Stop with the partition that contains this timestamp. The stop partition will be removed as well.
        Specify a date string in ISO 8601 format.</td>
    </tr> 
</table>
 

### Response

<pre class="header">Status: 200 OK</pre>

Response is of type string and list the partitions that have been removed.
