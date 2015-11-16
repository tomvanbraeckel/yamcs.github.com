---
layout: default
permalink: /docs/api/Download_Parameter_History/
sidebar: yes
---

Download archived parameters:

    GET /api/archive/:instance/downloads/parameters/:namespace/:name

    
<div class="hint">
This operation will possibly download a very large file. If you worry about size for your application, check out the support for <a href="/docs/api/List_Parameter_Data/">paged parameter retrievals</a> instead.
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
        <td class="code">order</td>
        <td class="code">string</td>
        <td>The order of the returned results. Can be either <tt>asc</tt> or <tt>desc</tt>. Default: <tt>asc</tt></td>
    </tr>
</table>


### Media Type

In addition to the usual support for JSON and Protobuf, the response for this particular resource can be made to output CSV data by setting the HTTP `Accept` header to `text/csv`.


### Response

The response will be a stream of individual parameters. When using Protobuf, every parameter is delimited by its byte size.
