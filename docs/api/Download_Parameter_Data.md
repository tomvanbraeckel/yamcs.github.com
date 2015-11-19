---
layout: default
permalink: /docs/api/Download_Parameter_Data/
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


### Response

The response will be a stream of individual parameters. When using Protobuf, every parameter is delimited by its byte size.

### CSV

In addition to the usual support for JSON and Protobuf, the response for this particular resource can be made to output CSV data in one of these ways:

1. Add the HTTP header: `Accept: text/csv`
1. Add a query parameter to the URI: `format=csv`
