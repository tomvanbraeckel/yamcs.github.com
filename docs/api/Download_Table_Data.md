---
layout: default
permalink: /docs/api/Download_Table_Data/
sidebar: yes
---

Download archived table data:

    GET /api/archive/:instance/downloads/tables/:table
    
<div class="hint">
This operation will possibly download a very large file. If you worry about size for your application, check out the support for <a href="/docs/api/List_Table_Data/">paged table data</a> instead.
</div>


### Parameters

<table class="inline">
    <tr>
        <th>Name</th>
        <th>Type</th>
        <th>Description</th>
    </tr>
    <tr>
        <td class="code">cols</td>
        <td class="code">array of strings</td>
        <td>
            The columns to be included in the result. Both these notations are accepted:
            <ul>
                <li><tt>?cols=rectime,gentime,pname</tt></li>
                <li><tt>?cols[]=rectime&cols[]=gentime&cols[]=pname</tt></li>
            </ul>
            If unspecified, all table and/or additional tuple columns will be included.
        </td>
    </tr>
    <tr>
        <td class="code">order</td>
        <td class="code">string</td>
        <td>The order of the returned results. Can be either <tt>asc</tt> or <tt>desc</tt>. Default: <tt>asc</tt></td>
    </tr>
</table>


### Response

The response will be a stream of individual table records. When using Protobuf, every table record is delimited by its byte size. 
